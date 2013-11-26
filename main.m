%% Êáèïñéóìüò åðéèõìçôÞò ôñï÷éÜò - áñ÷éêïðïßçóç
% 
%  Áñ÷éêÜ, êáèïñßæåôáé ç åðéèõìçôÞ ôñï÷ßá êßíçóçò ôïõ robot íá åßíáé êýêëïò
%  ï ïðïßïò èá âñßóêåôáé åðß óôáèåñïý z=h êáé åðïìÝíùò ç ôñßôç óõíôåôáãìÝíç
%  ôùí óçìåßùí ôçò ôñï÷éÜò èá åßíáé ðÜíôá ßóç ìå ôï z ôïõ êÝíôñïõ ôïõ
%  êýêëïõ. Ïé Üëëåò 2 óõíôåôáãìÝíåò ðñïêýðôïõí ìå ðïëéêÝò óõíôåôáãìÝíåò
%  ïñßæïíôáò ìéá áêôßíá r êáé ôéò ãùíßåò $\theta$ ìå ôïí áêüëïõèï ôñüðï:
%  Ãéá íá åêôÝëåóôåß êßíçóç ðïõ íá ÷áñáêôÞñéæåôáé áðü ïìáëüôçôá êáé ùò ðñïò
%  ôçí ôá÷ýôçôá èÝëïõìå 3 öÜóåéò:
%  1ç öÜóç speedup: speedup=s+1/2*epit*samples(1:sups).^2;, äçëáäÞ ïìáëÜ
%  åðéôá÷õíüìåíç ÷ùñßò áñ÷éêÞ ôá÷ýôçôá åðéôÜ÷õíóçò epit=0.5. Ïé ìåôáâëçôÝò
%  s êáé e áíôéðñïóùðåýïõí ôéò ãùíßåò áñ÷Þò êáé ôÝëïõò (0 êáé 2ð áíôßóôïé÷á).
%  2ç öÜóç steady:
%  steady=s+epit*supt.*(samples((sups+1):(last-sups))-supt/2), äçëáäÞ
%  äéáôÞñçóç óôáèåñÞò ôá÷ýôçôáò.
%  3ç öÜóç slowdown: êáèþò ðëçóéÜæïõìå óôï ôÝëïò ÷ñåéÜæåôáé íá ìåéþíåôáé ç
%  ôá÷ýôçôá ìÝ÷ñé íá óôáìáôÞóåé åíôåëþò.
%  slowdown=e-epit/2.*(tfin-samples((last-sups+1):last)).^2

clear all; close all; 

r=4;res=4;

load('1-meros.mat');

l = [10 10 10];pc=[8,8,8];

tfin=10;N=10000;
delta=tfin/N; 
samples=0:delta:tfin;  
last=length(samples);

s=0;e=2*pi;epit=0.5;

supt=tfin/2-1/2*sqrt((tfin^2*epit-4*(e-s))/epit);
sups=round(supt/tfin*last);

speedup=s+1/2*epit*samples(1:sups).^2;
steady=s+epit*supt.*(samples((sups+1):(last-sups))-supt/2);
slowdown=e-epit/2.*(tfin-samples((last-sups+1):last)).^2;

theta=[speedup steady slowdown];

trajectory=[pc(1)+r*cos(theta); pc(2)+r*sin(theta); pc(3)*ones(1,last)];

figure();
plot3(trajectory(1,:),trajectory(2,:),trajectory(3,:),'r');
hold on
plot3(pc(1),pc(2),pc(3),'.');
hold off
grid,title('åðéèõìçôÞ ôñï÷éÜ óôïé÷åßïõ äñÜóçò');
xlim([pc(1)-r-1 pc(1)+r+1]);ylim([pc(2)-r-1 pc(2)+r+1]);
view(-63,16);
axis square;

figure();
hold on;
plot(samples,trajectory(1,:),'r');
plot(samples,trajectory(2,:),'k');
plot(samples,trajectory(3,:),'b');
grid,title('åðéèõìçôÜ xyz óôïé÷åßïõ äñÜóçò');
legend('x_d','y_d','z_d',3,'Location','BestOutside');
hold off;

figure();
hold on;
plot(samples(2:end),diff(trajectory(1,:)),'r');
plot(samples(2:end),diff(trajectory(2,:)),'k');
plot(samples(2:end),diff(trajectory(3,:)),'b');
grid,title('    åðéèõìçôÞ ãñáììéêÞ ôá÷ýôçôá óôïé÷åßïõ äñÜóçò');
legend('v_{dx}','v_{dy}','v_{dz}',3,'Location','BestOutside');
hold off;

figure();
hold on;
plot(samples(1:length(speedup)),theta(1:length(speedup)),'r');grid;
plot(samples(length(speedup):length(speedup)+length(steady)-1),theta(length(speedup)+1:length(steady)+length(speedup)),'g');grid;
plot(samples(length(speedup)+length(steady):end),theta(end-length(slowdown):end),'b');grid;
hold off;
xlabel('t (sec)');
ylabel('ðáñÜãïíôáò è');
legend('speedup','steady','slowdown',3,'Location','South');

figure();
hold on;
plot(samples(1:length(speedup)-1),diff(theta(1:length(speedup))),'r');grid;
plot(samples(length(speedup):length(speedup)+length(steady)-2),diff(theta(length(speedup)+1:length(steady)+length(speedup))),'g');grid;
plot(samples(length(speedup)+length(steady):end-1),diff(theta(end-length(slowdown):end)),'b');grid;
hold off;
xlabel('t (sec)');
ylabel('ðáñÜãïíôáò dè/dt');
legend('speedup','steady','slowdown',3,'Location','South');

%% Áíôßóôñïöï ãåùìåôñéêü ìïíôÝëï - ðñïóäéïñéóìüò q êáé ðáñáãþãùí ôïõ

syms l1 l2 l3; syms px py pz;

q123=[];

for k=1:round(res*40):last
    
    q1a=subs(sol_q1(1,1),[px,py,pz,l1,l2,l3],[trajectory(1,k),trajectory(2,k),trajectory(3,k),l(1),l(2),l(3)]);
    q1b=subs(sol_q1(1,2),[px,py,pz,l1,l2,l3],[trajectory(1,k),trajectory(2,k),trajectory(3,k),l(1),l(2),l(3)]);
    q1=atan2(q1b,q1a);
    q2=subs(sol_q2,[px,py,pz,l1,l2,l3],[trajectory(1,k),trajectory(2,k),trajectory(3,k),l(1),l(2),l(3)]); 
    q3=subs(sol_q3,[px,py,pz,l1,l2,l3],[trajectory(1,k),trajectory(2,k),trajectory(3,k),l(1),l(2),l(3)]);
    
    q123=[q123;[q1(1),q2(1),q3(1)]];
    
end

len=length(q123);

h=tfin/len:tfin/len:tfin;

qdotted=[diff(q123(:,1)) diff(q123(:,2)) diff(q123(:,3))];

figure();
subplot(3,2,1)
plot(h,q123(:,1),'r'),grid;xlabel('t(sec)');title('q_1');
subplot(3,2,3)
plot(h,q123(:,2),'k'),grid;xlabel('t(sec)');title('q_2');
subplot(3,2,5)
plot(h,q123(:,3),'b'),grid;xlabel('t(sec)');title('q_3');
subplot(3,2,2)
plot(h(1:end),qdotted(:,1),'r'),grid;xlabel('t(sec)');title('q_1 paragwgos');
subplot(3,2,4)
plot(h(1:end),qdotted(:,2),'k'),grid;xlabel('t(sec)');title('q_2 paragwgos');
subplot(3,2,6)
plot(h(1:end),qdotted(:,3),'b'),grid;xlabel('t(sec)');title('q_3 paragwgos');


%% Åõèý ãåùìåôñéêü ìïíôÝëï - animation êßíçóçò
% ÔåëéêÜ, ãéá ôïí ðñïóäéïñéóìü ôùí x,y,z ôïõ ôåëéêïý óôïé÷åßïõ áðáéôåßôáé ç 
% åöáñìïãÞ ôïõ åõèÝïò ãåùìåôñéêïý ìïíôÝëïõ þóôå áðü ôïí ÷þñï ôùí áñèñþóåùí
% íá ðÜìå óôï ÷þñï ôùí xyz.
% Ãéá ôï animation åßíáé äõíáôÞ ç åðéëïãÞ 2-D Þ 3-D

syms q1 q2 q3; syms l1 l2 l3;

xyz2final=[]; xyz3final=[];

for i=1:len
    
    ar2=transpose(real(subs(A3(1:3,4),[q1,q2,q3,l1,l2,l3],[q123(i,1),q123(i,2),q123(i,3),l(1),l(2),l(3)])));
    ar3=transpose(real(subs(A5(1:3,4),[q1,q2,q3,l1,l2,l3],[q123(i,1),q123(i,2),q123(i,3),l(1),l(2),l(3)])));
    
    xyz2final=[xyz2final;[ar2(1) ar2(2) ar2(3)]];
    xyz3final=[xyz3final;[ar3(1) ar3(2) ar3(3)]];
    
end

figure();
hold on;
plot(samples(1:round(res*40):end),xyz3final(:,1),'r');grid;
plot(samples(1:round(res*40):end),xyz3final(:,2),'k');grid;
plot(samples(1:round(res*40):end),single(xyz3final(:,3)),'b');grid;
legend('x','y','z',3,'Location','East');
title('xyz ôåëéêïý åñãáëåßïõ äñÜóçò');
xlabel('t(sec)');
hold off;

vall=[diff(xyz3final(:,1))';diff(xyz3final(:,2))';diff(xyz3final(:,3))'];

% figure();
% hold on;
% plot(samples(round(res*40)+1:round(res*40):end),vall(1,:),'r');grid;
% plot(samples(round(res*40)+1:round(res*40):end),vall(2,:),'k');grid;
% plot(samples(round(res*40)+1:round(res*40):end),single(vall(3,:)),'b');grid;
% legend('v_x','v_y','v_z',3,'Location','BestOutside');
% title('ôá÷ýôçôá ôåëéêïý åñãáëåßïõ äñÜóçò');
% xlabel('t(sec)');
% hold off;

for i=1:len-1
                     
    JA=subs(JA,[q1,q2,q3,l1,l2,l3],[q123(i,1),q123(i,2),q123(i,3),l(1),l(2),l(3)]);
 
end;



for i=1:len-1
                     
    omega(i,:)=JA*qdotted(i,:)';
 
end;

figure();
hold on;
plot(h(2:end),omega(:,1),'r'),grid;xlabel('t(sec)');
plot(h(2:end),omega(:,2),'k'),grid;xlabel('t(sec)');
plot(h(2:end),omega(:,3),'b'),grid;xlabel('t(sec)');
legend('\omega_x','\omega_y','\omega_z',3,'Location','North');
hold off;

% edw epilegetai tupos animation: 2-D gia 2diastseis,3-D gia 3 kai
% oridhpote gia to sunduasmo kai twn 2

type_of_animation='3-D';
x=type_of_animation(1);
x=x(1);
x=str2double(x);

figure();

if x==2

animation(trajectory,xyz2final,xyz3final,l(1),len,pc,1);

elseif x==3
    
animation(trajectory,xyz2final,xyz3final,l(1),len,pc,0);

else   
    
    animation(trajectory,xyz2final,xyz3final,l(1),len,pc,1);
    figure();
    animation(trajectory,xyz2final,xyz3final,l(1),len,pc,0);
    
end;


%% DENAVIT HARTENBERG
clear all;
close all;
clc;

syms l1 l2 l3 q1 q2 q3 px py pz;

greeka=[0 l2 l3];
englisha=[pi/2 -pi/2 0];
d=[l1 0 0];
theta=[q1 q2 q3];

DH=[transpose(greeka),transpose(englisha),transpose(d),transpose(theta)];
pretty(DH);

%% ÅÕÈÕ ÃÅÙÌÅÔÑÉÊÏ ÌÏÍÔÅËÏ
%A1=A01,A2=A12,A3=A02,A4=A23,A5=A03,A6=A13
%% $${A^0_1}(q_1)$
i=1;
A1=[cos(theta(i)) -sin(theta(i))*round(cos(englisha(i))) sin(theta(i))*round(sin(englisha(i))) greeka(i)*cos(theta(i));sin(theta(i)) cos(theta(i))*round(cos(englisha(i))) -cos(theta(i))*round(sin(englisha(i))) greeka(i)*sin(theta(i));0 round(sin(englisha(i))) round(cos(englisha(i))) d(i);0 0 0 1];
pretty(A1);
%% $${A^1_2}(q_2)$
i=2;
A2=[cos(theta(i)) -sin(theta(i))*round(cos(englisha(i))) sin(theta(i))*round(sin(englisha(i))) greeka(i)*cos(theta(i));sin(theta(i)) cos(theta(i))*round(cos(englisha(i))) -cos(theta(i))*round(sin(englisha(i))) greeka(i)*sin(theta(i));0 round(sin(englisha(i))) round(cos(englisha(i))) d(i);0 0 0 1];
pretty(A2);
%% $${A^0_2}(q_1,q_2)$
A3=A1*A2;
pretty(A3);
%% $${A^2_3}(q_3)$
i=3;
A4=[cos(theta(i)) -sin(theta(i))*round(cos(englisha(i))) sin(theta(i))*round(sin(englisha(i))) greeka(i)*cos(theta(i));sin(theta(i)) cos(theta(i))*round(cos(englisha(i))) -cos(theta(i))*round(sin(englisha(i))) greeka(i)*sin(theta(i));0 round(sin(englisha(i))) round(cos(englisha(i))) d(i);0 0 0 1];
pretty(A4);
%% $${A^1_3}(q_2,q_3)$
A6=A2*A4;
pretty(A6);

%% $${A^0_3}(q_1,q_2,q_3)$
A5=A3*A4;
pretty(A5);

%% ÐËÇÑÇÓ ÉÁÊÙÂÉÁÍÇ ÌÇÔÑÁ-ÄÉÁÖÏÑÉÊÏ ÊÉÍÇÌÁÔÉÊÏ ÌÏÍÔÅËÏ

R01=A1(1:3,1:3);
R02=A3(1:3,1:3);
R03=A5(1:3,1:3);

b0=[0;0;1];
b1=R01*b0;
b2=R02*b0;

r0E=A5(:,4);
r1E=A5(:,4)-A1(:,4);
r2E=A5(:,4)-A3(:,4);

r0E=r0E(1:3);
r1E=r1E(1:3);
r2E=r2E(1:3);

JL1=cross(b0,r0E);
JL2=cross(b1,r1E);
JL3=cross(b2,r2E);
JL=[JL1 JL2 JL3];

JA1=b0;
JA2=b1;
JA3=b2;
JA=[JA1 JA2 JA3];

J=[JL1 JL2 JL3;JA1 JA2 JA3];
J=simplify(J);
pretty(J);

%%  ÅÕÑÅÓÇ ÉÄÉÏÌÏÑÖÙÍ ÄÉÁÔÁÎÅÙÍ
% ïñßæïõóá ôçò Üíù õðïìÞôñáò, ïé éäéüìïñöåò äéáôÜîåéò ðñïêýðôïõí üôáí ç Üíù
% õðïìÞôñá 3×3 ìçäåíßæåôáé
r=simplify(det(J(1:3,1:3)));
pretty(r);
S=solve(r,0,'q2','q3');
P=[S.q2(:,1) S.q3(:,1)];
pretty(P);
%% ÁÍÔÉÓÔÑÏÖÏ ÃÅÙÌÅÔÑÉÊÏ ÌÏÍÔÅËÏ
% ${A^0_1}^{-1}(q_1)$
invA1=inv(A1);
pretty(invA1);
%% Åýñåóç ôçò ëýóçò ôïõ óõóôÞìáôïò
% Ç åðßëõóç ðñïêýðôåé åðéëýïíôáò ôï óýóôçìá ôùí åîéóþóåùí:
%
% $1) {p_x}*cos(q_1)+{p_y}*sin(q_1)=l_2*cos(q_2)+l_3*cos(q_2)*cos(q_3)$
%
% $2) {p_z}-l_1=l_2*sin(q_2)+l_3*sin(q_2)*cos(q_3)$
%
% $3) {p_x}*sin(q_1)-{p_y}*cos(q_1)=-l_3*sin(q_3)$

%% Åýñåóç ôïõ ${q_3}$
A13vector=A6(1:3,4);
othervector=invA1(1:3,:)*transpose([px py pz 1]);
sum1=sum(othervector.^2);
sum2=sum(A13vector.^2);
sol_q3=solve(sum1-sum2,0);
pretty(sol_q3);
sol_q3=sol_q3(1,1);

syms c3 s3;

c3=cos(sol_q3(1,1));
s3=sin(sol_q3(1,1));
disp('');
disp('eksiswsh gia to q2');
disp(simplify(A13vector(2)-othervector(2)));
disp('');

A13vector(1)=subs(A13vector(1),cos(q3),c3);
A13vector(2)=subs(A13vector(2),cos(q3),c3);
A13vector(3)=subs(A13vector(3),sin(q3),s3);

%% Åýñåóç ôïõ ${q_2}$
syms c2 s2;
sol_q2=solve(A13vector(2)-othervector(2),0);
pretty(sol_q2);
sol_q2=sol_q2(1,1);
c2=cos(sol_q2(1,1));
s2=sin(sol_q2(1,1));

%% Åýñåóç ôïõ ${q_1}$
% To ${q_1}$ ðñïóäéïñßæåôáé áðü ôçí åîßóùóç:
syms a b c d;

othervector(1)=subs(othervector(1),cos(q1),a);
othervector(1)=subs(othervector(1),cos(q1),b);

othervector(3)=subs(othervector(1),cos(q1),a);
othervector(3)=subs(othervector(1),cos(q1),b);

c=subs(A13vector(1),cos(q2),c2);
d=A13vector(3);

b=simplify((d*px+c*py)/(px^2+py^2));
a=simplify((c-b*py)/(px));

sol_q1=[a b];
disp('atan2(b,a) üðïõ b êáé a áíôßóôïé÷á óõíáñôÞóåéò ôùí q2,q3');

%% $${A^0_2}^{-1}(q_2)$
pretty(inv(A3));
%% $${A^0_3}^{-1}(q_3)$
pretty(inv(A5));
%% ÁÍÔÉÓÔÑÏÖÏ ÄÉÁÖÏÑÉÊÏ ÌÏÍÔÅËÏ
% åîáéñþíôáò ôéò éäéüìïñöåò äéáôÜîåéò ìðïñïýìå íá áíôéóôñÝøïõìå ôçí õðïìÞôñá

InvJ=simplify(inv(J(1:3,1:3)));

pretty(InvJ);

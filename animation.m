function [] = animation(trajectory,xyz2final,xyz3final,l,length,pc,v)
if v==1  
   
for tk=1:length
    
pause(0.1);clf 

subplot(1,2,1);
view(0,0)
axis on ,hold on ;
title('2d-animation z-x (cm)');xlabel('x');ylabel('y');zlabel('z');grid;
plot3(trajectory(1,:),trajectory(2,:),trajectory(3,:),'-r');
plot3(0,0,0,'ms','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','k',...
                'MarkerSize',3);
plot3([0 0],[0 0],[l(1) 0],'b');
text(pc(1)+0.4,pc(2),pc(3)-0.5,'p_c');
text(0+0.4,0,l(1),'O_1');
text(0+0.4,0,0+0.35,'O_0');
text(xyz2final(tk,1)+0.4,xyz2final(tk,2),xyz2final(tk,3),'O_2');
text(xyz3final(tk,1)-0.4,xyz3final(tk,2),xyz3final(tk,3)+0.4,'O_E');
plot3(pc(1),pc(2),pc(3),'.');
plot3([0],[0],[l],'ms','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','k',...
                'MarkerSize',3);
plot3([0 xyz2final(tk,1)], [0 xyz2final(tk,2)],[l xyz2final(tk,3)],'b');
plot3([xyz2final(tk,1) xyz3final(tk,1)], [xyz2final(tk,2) xyz3final(tk,2)],[xyz2final(tk,3) xyz3final(tk,3)],'b');
plot3(xyz2final(tk,1),xyz2final(tk,2),xyz2final(tk,3),'ms','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','k',...
                'MarkerSize',4);
plot3(xyz3final(tk,1),xyz3final(tk,2),xyz3final(tk,3),'+'); 
   
  for tk1=1:tk
   plot3([xyz3final(tk1,1)],[xyz3final(tk1,2)],[xyz3final(tk1,3)],'k+'); 
  end 
  
subplot(1,2,2);
view(0,90)
  
axis on ,hold on ;
title('2d-animation y-x (cm)');xlabel('x');ylabel('y');zlabel('z');grid;
plot3(trajectory(1,:),trajectory(2,:),trajectory(3,:),'-r');
plot3(0,0,0,'ms','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','k',...
                'MarkerSize',3);
plot3([0 0],[0 0],[l(1) 0],'b');
text(pc(1)+0.4,pc(2),pc(3),'p_c');
text(0+0.4,0,0,'O_0,O_1');
text(xyz2final(tk,1)+0.4,xyz2final(tk,2),xyz2final(tk,3),'O_2');
text(xyz3final(tk,1)+0.4,xyz3final(tk,2),xyz3final(tk,3),'O_E');
plot3(pc(1),pc(2),pc(3),'.');
plot3([0],[0],[l],'ms','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','k',...
                'MarkerSize',3);
plot3([0 xyz2final(tk,1)], [0 xyz2final(tk,2)],[l xyz2final(tk,3)],'b');
plot3([xyz2final(tk,1) xyz3final(tk,1)], [xyz2final(tk,2) xyz3final(tk,2)],[xyz2final(tk,3) xyz3final(tk,3)],'b');
plot3(xyz2final(tk,1),xyz2final(tk,2),xyz2final(tk,3),'ms','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','k',...
                'MarkerSize',4);
plot3(xyz3final(tk,1),xyz3final(tk,2),xyz3final(tk,3),'+'); 
   
  for tk1=1:tk
   plot3([xyz3final(tk1,1)],[xyz3final(tk1,2)],[xyz3final(tk1,3)],'k+'); 
  end 
  
  
end

else
    
for tk=1:round(5*length/5)
    
pause(0.1);clf 
    
view(-78,24);
axis on ,hold on ;
title('3d-animation x-y-z (cm)');xlabel('x');ylabel('y');zlabel('z');grid;
plot3(trajectory(1,:),trajectory(2,:),trajectory(3,:),'-r');
plot3(0,0,0,'ms','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','k',...
                'MarkerSize',3);
plot3([0 0],[0 0],[l(1) 0],'b');
text(pc(1)+0.4,pc(2),pc(3),'p_c');
text(0+0.4,0,l(1),'O_1');
text(0+0.4,0,0,'O_0');
% text(xyz2final(tk,1)+0.4,xyz2final(tk,2),xyz2final(tk,3),'O_2');
% text(xyz3final(tk,1)+0.4,xyz3final(tk,2),xyz3final(tk,3),'O_E');
plot3(pc(1),pc(2),pc(3),'.');
plot3([0],[0],[l],'ms','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','k',...
                'MarkerSize',3);
plot3([0 xyz2final(tk,1)], [0 xyz2final(tk,2)],[l xyz2final(tk,3)],'b');
plot3([xyz2final(tk,1) xyz3final(tk,1)], [xyz2final(tk,2) xyz3final(tk,2)],[xyz2final(tk,3) xyz3final(tk,3)],'b');
plot3(xyz2final(tk,1),xyz2final(tk,2),xyz2final(tk,3),'ms','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','k',...
                'MarkerSize',4);
plot3(xyz3final(tk,1),xyz3final(tk,2),xyz3final(tk,3),'+'); 
   
  for tk1=1:tk
   plot3([xyz3final(tk1,1)],[xyz3final(tk1,2)],[xyz3final(tk1,3)],'k+'); 
  end 
  
  
end
hold off;
% figure();
% for tk=ceil(length/5):round(2*length/5)
%     
% pause(0.1);clf 
%     
% view(-78,24);
% axis on ,hold on ;
% title('3d-animation x-y-z (cm)');xlabel('x');ylabel('y');zlabel('z');grid;
% plot3(trajectory(1,:),trajectory(2,:),trajectory(3,:),'-r');
% plot3(0,0,0,'ms','LineWidth',2,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','k',...
%                 'MarkerSize',3);
% plot3([0 0],[0 0],[l(1) 0],'b');
% text(pc(1)+0.4,pc(2),pc(3),'p_c');
% text(0+0.4,0,l(1),'O_1');
% text(0+0.4,0,0,'O_0');
% text(xyz2final(tk,1)+0.4,xyz2final(tk,2),xyz2final(tk,3),'O_2');
% text(xyz3final(tk,1)+0.4,xyz3final(tk,2),xyz3final(tk,3),'O_E');
% plot3(pc(1),pc(2),pc(3),'.');
% plot3([0],[0],[l],'ms','LineWidth',2,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','k',...
%                 'MarkerSize',3);
% plot3([0 xyz2final(tk,1)], [0 xyz2final(tk,2)],[l xyz2final(tk,3)],'b');
% plot3([xyz2final(tk,1) xyz3final(tk,1)], [xyz2final(tk,2) xyz3final(tk,2)],[xyz2final(tk,3) xyz3final(tk,3)],'b');
% plot3(xyz2final(tk,1),xyz2final(tk,2),xyz2final(tk,3),'ms','LineWidth',2,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','k',...
%                 'MarkerSize',4);
% plot3(xyz3final(tk,1),xyz3final(tk,2),xyz3final(tk,3),'+'); 
%    
%   for tk1=1:tk
%    plot3([xyz3final(tk1,1)],[xyz3final(tk1,2)],[xyz3final(tk1,3)],'k+'); 
%   end 
%   
%   
% end
% hold off;
% figure();
% for tk=ceil(2*length/5):round(3*length/5)
%     
% pause(0.1);clf 
%     
% view(-78,24);
% axis on ,hold on ;
% title('3d-animation x-y-z (cm)');xlabel('x');ylabel('y');zlabel('z');grid;
% plot3(trajectory(1,:),trajectory(2,:),trajectory(3,:),'-r');
% plot3(0,0,0,'ms','LineWidth',2,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','k',...
%                 'MarkerSize',3);
% plot3([0 0],[0 0],[l(1) 0],'b');
% text(pc(1)+0.4,pc(2),pc(3),'p_c');
% text(0+0.4,0,l(1),'O_1');
% text(0+0.4,0,0,'O_0');
% text(xyz2final(tk,1)+0.4,xyz2final(tk,2),xyz2final(tk,3),'O_2');
% text(xyz3final(tk,1)+0.4,xyz3final(tk,2),xyz3final(tk,3),'O_E');
% plot3(pc(1),pc(2),pc(3),'.');
% plot3([0],[0],[l],'ms','LineWidth',2,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','k',...
%                 'MarkerSize',3);
% plot3([0 xyz2final(tk,1)], [0 xyz2final(tk,2)],[l xyz2final(tk,3)],'b');
% plot3([xyz2final(tk,1) xyz3final(tk,1)], [xyz2final(tk,2) xyz3final(tk,2)],[xyz2final(tk,3) xyz3final(tk,3)],'b');
% plot3(xyz2final(tk,1),xyz2final(tk,2),xyz2final(tk,3),'ms','LineWidth',2,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','k',...
%                 'MarkerSize',4);
% plot3(xyz3final(tk,1),xyz3final(tk,2),xyz3final(tk,3),'+'); 
%    
%   for tk1=1:tk
%    plot3([xyz3final(tk1,1)],[xyz3final(tk1,2)],[xyz3final(tk1,3)],'k+'); 
%   end 
%   
%   
% end
% hold off;
% figure();
% for tk=ceil(3*length/5):round(4*length/5)
%     
% pause(0.1);clf 
%     
% view(-78,24);
% axis on ,hold on ;
% title('3d-animation x-y-z (cm)');xlabel('x');ylabel('y');zlabel('z');grid;
% plot3(trajectory(1,:),trajectory(2,:),trajectory(3,:),'-r');
% plot3(0,0,0,'ms','LineWidth',2,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','k',...
%                 'MarkerSize',3);
% plot3([0 0],[0 0],[l(1) 0],'b');
% text(pc(1)+0.4,pc(2),pc(3),'p_c');
% text(0+0.4,0,l(1),'O_1');
% text(0+0.4,0,0,'O_0');
% text(xyz2final(tk,1)+0.4,xyz2final(tk,2),xyz2final(tk,3),'O_2');
% text(xyz3final(tk,1)+0.4,xyz3final(tk,2),xyz3final(tk,3),'O_E');
% plot3(pc(1),pc(2),pc(3),'.');
% plot3([0],[0],[l],'ms','LineWidth',2,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','k',...
%                 'MarkerSize',3);
% plot3([0 xyz2final(tk,1)], [0 xyz2final(tk,2)],[l xyz2final(tk,3)],'b');
% plot3([xyz2final(tk,1) xyz3final(tk,1)], [xyz2final(tk,2) xyz3final(tk,2)],[xyz2final(tk,3) xyz3final(tk,3)],'b');
% plot3(xyz2final(tk,1),xyz2final(tk,2),xyz2final(tk,3),'ms','LineWidth',2,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','k',...
%                 'MarkerSize',4);
% plot3(xyz3final(tk,1),xyz3final(tk,2),xyz3final(tk,3),'+'); 
%    
%   for tk1=1:tk
%    plot3([xyz3final(tk1,1)],[xyz3final(tk1,2)],[xyz3final(tk1,3)],'k+'); 
%   end 
%   
%   
% end
% hold off;
% figure();
% for tk=ceil(4*length/5):length
%     
% pause(0.1);clf 
%     
% view(-78,24);
% axis on ,hold on ;
% title('3d-animation x-y-z (cm)');xlabel('x');ylabel('y');zlabel('z');grid;
% plot3(trajectory(1,:),trajectory(2,:),trajectory(3,:),'-r');
% plot3(0,0,0,'ms','LineWidth',2,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','k',...
%                 'MarkerSize',3);
% plot3([0 0],[0 0],[l(1) 0],'b');
% text(pc(1)+0.4,pc(2),pc(3),'p_c');
% text(0+0.4,0,l(1),'O_1');
% text(0+0.4,0,0,'O_0');
% text(xyz2final(tk,1)+0.4,xyz2final(tk,2),xyz2final(tk,3),'O_2');
% text(xyz3final(tk,1)+0.4,xyz3final(tk,2),xyz3final(tk,3),'O_E');
% plot3(pc(1),pc(2),pc(3),'.');
% plot3([0],[0],[l],'ms','LineWidth',2,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','k',...
%                 'MarkerSize',3);
% plot3([0 xyz2final(tk,1)], [0 xyz2final(tk,2)],[l xyz2final(tk,3)],'b');
% plot3([xyz2final(tk,1) xyz3final(tk,1)], [xyz2final(tk,2) xyz3final(tk,2)],[xyz2final(tk,3) xyz3final(tk,3)],'b');
% plot3(xyz2final(tk,1),xyz2final(tk,2),xyz2final(tk,3),'ms','LineWidth',2,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','k',...
%                 'MarkerSize',4);
% plot3(xyz3final(tk,1),xyz3final(tk,2),xyz3final(tk,3),'+'); 
%    
%   for tk1=1:tk
%    plot3([xyz3final(tk1,1)],[xyz3final(tk1,2)],[xyz3final(tk1,3)],'k+'); 
%   end 
%   
%   
% end
% hold off;

end

end




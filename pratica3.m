%ALVAREZ SANDOVAL IRVIN TONATIHU
%ROBOTICA INDUSTRIAL

clear all
clc
%--------PREGUNTA UN VALOR EN GRADOS PARA CADA ARTICULACIÓN DEL BRAZO----
prompt='Introduce valor (ángulo) de la primer articulación:';
angDeg=input(prompt);

prompt='Introduce valor (ángulo) de la  segunda articulación:';
angDeg2=input(prompt);

prompt='Introduce valor (ángulo) de la  tercera articulación:';
angDeg3=input(prompt);

%-------PREGUNTA LA DISTANCIA DE CADA ARTICULACIÓN DEL BRAZO------------------
prompt='introduce valor de L1:';
L1=input(prompt);

prompt='introduce valor de L2:';
L2=input(prompt);

prompt='introduce valor de L3:';
L3=input(prompt);

theta1= deg2rad(angDeg)
theta2= deg2rad(angDeg2)
theta3= deg2rad(angDeg3)


p1=[0 0 0]'
%---------------------------------PRIMER ARTICULACIÓN-------------------------
if angDeg>=0
    
    angVec=0:0.01:theta1
else
    angVec=0:-0.01:theta1   
end    

for v=1:length(angVec)
    
        clf
        imprimir();
        grid on 
        view(120,30)
        
        
        Rz= [cos(angVec(v)) -sin(angVec(v)) 0 0 ;sin(angVec(v)) cos(angVec(v)) 0 0 ; 0 0 1 0; 0 0 0 1];
        Tx=[1 0 0 0; 0 1 0 0; 0 0 1 L1;0 0 0 1];
        
        T1=Rz*Tx;
        p2=T1(1:3,4);
        eje_x1=T1(1:3,1)
        eje_y1=T1(1:3,2)
        eje_z1=T1(1:3,3)
        
       
        
        line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[1 0.5 0],'linewidth',5);
        line([p1(1) eje_x1(1)],[p1(2) eje_x1(2)],[p1(3) eje_x1(3)],'color',[1 0 0],'linewidth',2.5);
        line([p1(1) eje_y1(1)],[p1(2) eje_y1(2)],[p1(3) eje_y1(3)],'color',[0 1 0],'linewidth',2.5);
        line([p1(1) eje_z1(1)],[p1(2) eje_z1(2)],[p1(3) eje_z1(3)],'color',[0 0 1],'linewidth',2.5);
        
        
        TRz2=[cos(0) -sin(0) 0 0 ;sin(0) cos(0) 0 0 ; 0 0 1 0; 0 0 0 1];
        Tx2=[1 0 0 0; 0 1 0 L2; 0 0 1 0;0 0 0 1];
        T2=TRz2*Tx2
        Tf=T1*T2
        
        p3=Tf(1:3,4);
        eje_x2=p2+Tf(1:3,1)
        eje_y2=p2+Tf(1:3,2)
        eje_z2=p2+Tf(1:3,3)
        
        eje_x3=p3+Tf(1:3,1)
        eje_y3=p3+Tf(1:3,2)
        eje_z3=p3+Tf(1:3,3)
        
        line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[1 0.5 0],'linewidth',5);
        line([p2(1) eje_x2(1)],[p2(2) eje_x2(2)],[p2(3) eje_x2(3)],'color',[0 1 0],'linewidth',2.5);
        line([p2(1) eje_y2(1)],[p2(2) eje_y2(2)],[p2(3) eje_y2(3)],'color',[1 0 0],'linewidth',2.5);
        line([p2(1) eje_z2(1)],[p2(2) eje_z2(2)],[p2(3) eje_z2(3)],'color',[0 0 1],'linewidth',2.5);
        
        line([p3(1) eje_x3(1)],[p3(2) eje_x3(2)],[p3(3) eje_x3(3)],'color',[0 1 0],'linewidth',2.5);
        line([p3(1) eje_y3(1)],[p3(2) eje_y3(2)],[p3(3) eje_y3(3)],'color',[0 1 0],'linewidth',2.5);
        line([p3(1) eje_z3(1)],[p3(2) eje_z3(2)],[p3(3) eje_z3(3)],'color',[0 0 1],'linewidth',2.5);
        
        TRz3=[cos(0) -sin(0) 0 0 ;sin(0) cos(0) 0 0 ; 0 0 1 0; 0 0 0 1];
        Tx3=[1 0 0 0; 0 1 0 L3; 0 0 1 0;0 0 0 1];
        T3=TRz3*Tx3;
        tf=T1*T2*T3
        p4=tf(1:3,4);
        
        eje_x4=p4+tf(1:3,1)
        eje_y4=p4+tf(1:3,2)
        eje_z4=p4+tf(1:3,3)
        
        
        line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[1 0.5 0],'linewidth',5);
        line([p4(1) eje_x4(1)],[p4(2) eje_x4(2)],[p4(3) eje_x4(3)],'color',[1 0 0],'linewidth',2.5);
        line([p4(1) eje_y4(1)],[p4(2) eje_y4(2)],[p4(3) eje_y4(3)],'color',[0 1 0],'linewidth',2.5);
        line([p4(1) eje_z4(1)],[p4(2) eje_z4(2)],[p4(3) eje_z4(3)],'color',[0 0 1],'linewidth',2.5);
        
        
       
        
        pause(0.01)
end
%-----------------------------SEGUNDA ARTICULACIÓN-----------------------------------
if angDeg2>=0
    
    angVec2= 0:0.01:theta2;
else
    angVec2= 0:-0.01:theta2;    
end    

for v=1:length(angVec2)
        clf
        imprimir();
        grid on
        view(120,30)
        
    
        p2=T1(1:3,4);
        
        eje_x1=T1(1:3,1)
        eje_y1=T1(1:3,2)
        eje_z1=T1(1:3,3)
        
        
        line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[1 0.5 0],'linewidth',5);
        
        line([p1(1) eje_x1(1)],[p1(2) eje_x1(2)],[p1(3) eje_x1(3)],'color',[0 1 0],'linewidth',2.5);
        line([p1(1) eje_y1(1)],[p1(2) eje_y1(2)],[p1(3) eje_y1(3)],'color',[1 0 0],'linewidth',2.5);
        line([p1(1) eje_z1(1)],[p1(2) eje_z1(2)],[p1(3) eje_z1(3)],'color',[0 0 1],'linewidth',2.5);
        
                
        TRz2=[1 0 0 0;0 cos(angVec2(v)) -sin(angVec2(v)) 0 ;0 sin(angVec2(v)) cos(angVec2(v)) 0; 0 0 0 1];
        Tx2=[1 0 0 0; 0 1 0 L2; 0 0 1 0;0 0 0 1];
        T2=TRz2*Tx2
        Tf=T1*T2
        
        
        p3=Tf(1:3,4);
        
        eje_x2=p2+Tf(1:3,1)
        eje_y2=p2+Tf(1:3,2)
        eje_z2=p2+Tf(1:3,3)
        
       
        
        eje_x3=p3+Tf(1:3,1)
        eje_y3=p3+Tf(1:3,2)
        eje_z3=p3+Tf(1:3,3)
        
        
        line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[1 0.5 0],'linewidth',5);
        
        line([p2(1) eje_x2(1)],[p2(2) eje_x2(2)],[p2(3) eje_x2(3)],'color',[0 1 0],'linewidth',2.5);
        line([p2(1) eje_y2(1)],[p2(2) eje_y2(2)],[p2(3) eje_y2(3)],'color',[1 0 0],'linewidth',2.5);
        line([p2(1) eje_z2(1)],[p2(2) eje_z2(2)],[p2(3) eje_z2(3)],'color',[0 0 1],'linewidth',2.5);
        
       
        
        line([p3(1) eje_x3(1)],[p3(2) eje_x3(2)],[p3(3) eje_x3(3)],'color',[0 1 0],'linewidth',2.5);
        line([p3(1) eje_y3(1)],[p3(2) eje_y3(2)],[p3(3) eje_y3(3)],'color',[1 0 0],'linewidth',2.5);
        line([p3(1) eje_z3(1)],[p3(2) eje_z3(2)],[p3(3) eje_z3(3)],'color',[0 0 1],'linewidth',2.5);
        
        
        TRz3=[cos(0) -sin(0) 0 0 ;sin(0) cos(0) 0 0 ; 0 0 1 0; 0 0 0 1];
        Tx3=[1 0 0 0; 0 1 0 L3; 0 0 1 0;0 0 0 1];
        T3=TRz3*Tx3;
        tf=T1*T2*T3
        p4=tf(1:3,4);
        
        
        
        eje_x4=p4+tf(1:3,1)
        eje_y4=p4+tf(1:3,2)
        eje_z4=p4+tf(1:3,3)
        
        
        line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[1 0.5 0],'linewidth',5);
        
        line([p4(1) eje_x4(1)],[p4(2) eje_x4(2)],[p4(3) eje_x4(3)],'color',[0 1 0],'linewidth',2.5);
        line([p4(1) eje_y4(1)],[p4(2) eje_y4(2)],[p4(3) eje_y4(3)],'color',[1 0 0],'linewidth',2.5);
        line([p4(1) eje_z4(1)],[p4(2) eje_z4(2)],[p4(3) eje_z4(3)],'color',[0 0 1],'linewidth',2.5);
        
        
        
        pause(0.01)
        
end
%----------------------------------------TERCERA ARTICULACIÓN--------------------------------
if angDeg3>=0
    
    angVec3= 0:0.01:theta3;
else
    angVec3= 0:-0.01:theta3;    
end    

for v=1:length(angVec3)
    
        clf
        imprimir();
        grid on 
        view(120,30)
        
        T1=Rz*Tx;
        p2=T1(1:3,4);
        eje_x1=T1(1:3,1)
        eje_y1=T1(1:3,2)
        eje_z1=T1(1:3,3)
        
       
        
        line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[1 0.5 0],'linewidth',5);
        
        line([p1(1) eje_x1(1)],[p1(2) eje_x1(2)],[p1(3) eje_x1(3)],'color',[0 1 0],'linewidth',2.5);
        line([p1(1) eje_y1(1)],[p1(2) eje_y1(2)],[p1(3) eje_y1(3)],'color',[1 0 0],'linewidth',2.5);
        line([p1(1) eje_z1(1)],[p1(2) eje_z1(2)],[p1(3) eje_z1(3)],'color',[0 0 1],'linewidth',2.5);
        
       
        
        
        p3=Tf(1:3,4);
        
        eje_x2=p2+Tf(1:3,1)
        eje_y2=p2+Tf(1:3,2)
        eje_z2=p2+Tf(1:3,3)
      
        
        
        
        eje_x3=p3+tf(1:3,1)
        eje_y3=p3+tf(1:3,2)
        eje_z3=p3+tf(1:3,3)
        
        line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[1 0.5 0],'linewidth',5);
        
        line([p2(1) eje_x2(1)],[p2(2) eje_x2(2)],[p2(3) eje_x2(3)],'color',[0 1 0],'linewidth',2.5);
        line([p2(1) eje_y2(1)],[p2(2) eje_y2(2)],[p2(3) eje_y2(3)],'color',[1 0 0],'linewidth',2.5);
        line([p2(1) eje_z2(1)],[p2(2) eje_z2(2)],[p2(3) eje_z2(3)],'color',[0 0 1],'linewidth',2.5);
        
        
        
        line([p3(1) eje_x3(1)],[p3(2) eje_x3(2)],[p3(3) eje_x3(3)],'color',[0 1 0],'linewidth',2.5);
        line([p3(1) eje_y3(1)],[p3(2) eje_y3(2)],[p3(3) eje_y3(3)],'color',[1 0 0],'linewidth',2.5);
        line([p3(1) eje_z3(1)],[p3(2) eje_z3(2)],[p3(3) eje_z3(3)],'color',[0 0 1],'linewidth',2.5);
        
        
        TRz3=[1 0 0 0;0 cos(angVec3(v)) -sin(angVec3(v)) 0 ;0 sin(angVec3(v)) cos(angVec3(v)) 0; 0 0 0 1];
        Tx3=[1 0 0 0; 0 1 0 L3 ; 0 0 1 0;0 0 0 1];
        T3=TRz3*Tx3
        tf=T1*T2*T3
        p4=tf(1:3,4);
        
        
        eje_x4=p4+tf(1:3,1)
        eje_y4=p4+tf(1:3,2)
        eje_z4=p4+tf(1:3,3)
        
        
        line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[1 0.5 0],'linewidth',5);
        
        line([p4(1) eje_x4(1)],[p4(2) eje_x4(2)],[p4(3) eje_x4(3)],'color',[0 1 0],'linewidth',2.5);
        line([p4(1) eje_y4(1)],[p4(2) eje_y4(2)],[p4(3) eje_y4(3)],'color',[1 0 0],'linewidth',2.5);
        line([p4(1) eje_z4(1)],[p4(2) eje_z4(2)],[p4(3) eje_z4(3)],'color',[0 0 1],'linewidth',2.5);
        
        pause(0.01)
end
        

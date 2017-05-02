%This script is written by Amanda Singleton and Claire Reiger
%This script simulates a bouncing ball, with certain initial and physical conditions 
clf;
r=0.05; %the radius of the disk
x0=0.5; y0=1-r; u0=0.3; v0=0; %initial position and velocity
x=x0; y=y0; u=u0; v=v0; %initializing variables
xmin=r; ymin=r; xmax=1-r; ymax=1-r; %boundary "walls"
alpha=0.8; beta=0.99; %physical conditions: friction and deformation
t=0; tf=60;%initial and final time
dt=.03;%time step
ax=0;%acceleration in the x direction
ay=-0.0981; %acceleration in the y direction


while t<tf %progress until final time is reached
    if y0+dt*v0<ymin %if in the next time step, the ball would be below ymin
        if v<0
        dtnew=(ymin-y)/v; %rewrite 
        %x=x0+u*dtnew;
        %y=ymin;
        v0= -alpha*v;
        u0= beta*u;
        end

    end
    if x<xmin
        if u<0
        dtnew=(xmin-x)/u;
        %y=y0+v*dtnew;
        %x=xmin;
        u0=-alpha*u;
        end
    end
    if x>xmax
        if u>0
        dtnew=(xmin-x)/u;
        %y=y0+v*dtnew;
        %x=xmax;
        u0=-alpha*u;
        end
    end
   
    x=x0+dt*u0;
    y=y0+dt*v0;
    u=u0+dt*ax;
    v=v0+dt*ay;
    t=t+dt;
    x0=x; u0=u;
    y0=y; v0=v;
    Draw_Disk_Color(x,y,r,[0 1 0]);
        
    axis([0 1 0 1])
    pause(dt/10);
end
%I confirm that I did not use codes from the web or from past years'
%assignments and that the work I submit is my own and my partner's only
clf;
close all;
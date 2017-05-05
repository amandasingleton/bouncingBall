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
k=1;
map=hsv;
while t<tf %progress until final time is reached
    switch true
        case y0+dt*v0<ymin %if in the next time step, the ball would be below ymin
            dtnew=(ymin-y)/v;
            x=x0+u*dtnew;
            y=ymin;
            v0= -alpha*v; %reverses the direction of velocity
            u0= beta*u;
            
        case y0+dt*v0>ymax %if in the next time step, the ball would be above ymax
            dtnew=(ymax-y)/v;
            x=x0+u*dtnew;
            y=ymax;
            v0= -alpha*v; %reverses the direction of velocity
            u0= beta*u;   
            
        case x0+dt*u0<xmin %if in the next time step, the ball would be left of xmin
            dtnew=(xmin-x)/u;
            y=y0+v*dtnew;
            x=xmin;
            u0=-alpha*u;
            v0= beta*v;
            
        case x0+dt*u0>xmax %if in the next time step, the ball would be right of xmax
            dtnew=(xmax-x)/u;
            y=y0+v*dtnew;
            x=xmax;
            u0=-alpha*u;
            v0= beta*v;
            
        otherwise %if the ball will not cross a boundary in the next time step
            %sets new position based on velocity
            x=x0+dt*u0;
            y=y0+dt*v0;
            
            %sets new velocity based on acceleration
            u=u0+dt*ax;
            v=v0+dt*ay;
            
            %increment and prepare for the next iteration
            t=t+dt;
            x0=x; u0=u;
            y0=y; v0=v;
            
            %draw the disk at position (x,y)
            Draw_Disk_Color(x,y,r,map(k,:));
            hold on    
            axis([0 1 0 1])
            
            k=k+1;
            if k==64
                k=1;
            end
            pause(dt/10);
   end
end
%I confirm that I did not use codes from the web or from past years'
%assignments and that the work I submit is my own and my partner's only

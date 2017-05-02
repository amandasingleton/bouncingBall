clf;
x0=0.5; y0=1; u0=0.3; v0=0; x=x0; y=y0;
xmin=0; ymin=0; xmax=1; ymax=1;
alpha=0.8; beta=0.99;


t=0; tf=60;
dt=.03;
ax=0;
ay=-0.0981;
%
g=1:10:500;

while t<tf
    if y<ymin
        if v<0
        dtnew=(ymin-y)/v;
        x=x0+u*dtnew;
        y=ymin;
        v0= -alpha*v;
        u0= beta*u;
        end
%         if abs(v)<2
%             v0=0;
%         end
    end
    if x<xmin
        if u<0
        dtnew=(xmin-x)/u;
        y=y0+v*dtnew;
        x=xmin;
        u0=-alpha*u;
        end
    end
    if x>xmax
        if u>0
        dtnew=(xmin-x)/u;
        y=y0+v*dtnew;
        x=xmax;
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
    %adds grass
    %plot(g,1,'g^','Markersize',10,'Markerfacecolor','g');
    %hold on
    plot(x,y,'rs','MarkerSize',10,'MarkerFaceColor','r');
    %hold off
    axis([0 1 0 1])
    pause(dt/10);
end
%I confirm that I did not use codes from the web or from past years'
%assignments and that the work I submit is my own and my partner's only
clf;

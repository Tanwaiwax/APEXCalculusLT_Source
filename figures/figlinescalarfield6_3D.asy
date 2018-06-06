include apexconfig;
import palette;

// ASY file for fig:linescalarfield6 in Section 14.1

size(200,200,IgnoreAspect);
currentprojection=orthographic(14.4,-6.86,4);

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={2};
real[] myzchoice={2};
pair xbounds=(-.2,2.5);
pair ybounds=(-.2,2.5);
pair zbounds=(-.1,2.1);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//real r(real t) {return 3exp(-0.1*t);}
real x(real t) {return 1+cos(t);}
real y(real t) {return 1+sin(t);}
real z(real t) {return 1+sin(2*t);}

path3 p=graph(x,y,z,0,2*pi,50,operator ..);

tube T=tube(p,.05);
surface s=T.s;
s.colors(palette(s.map(ypart)+s.map(zpart),Gradient(palered,heavyblue)));
draw(s,render(merge=true));
draw(shift(1,1.25,1.2)*scale3(.05)*unitsphere);


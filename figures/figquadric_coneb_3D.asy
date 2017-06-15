include apexconfig;

//ASY file for quadric library in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,1);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-3.5,3.5);
pair ybounds=(-3.5,3.5);
pair zbounds=(-3,3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the top half of the surface z^2 = x^2/(1.5)^2+y^2
triple f(pair t) {
       return (1.5*t.y*cos(t.x),t.y*sin(t.x),t.y);
}
surface s=surface(f,(0,-2),(2*pi,2),32,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw the traces for y=0
triple g(real t) {return (t,0,t/1.5);}
path3 mypath=graph(g,-3,3,operator ..);
draw(mypath,colortwo);
triple g(real t) {return (t,0,-t/1.5);}
path3 mypath=graph(g,-3,3,operator ..);
draw(mypath,colortwo);

//Draw the trace for z=-2
triple g(real t) {return (1.5*1.5*cos(t),1.5*sin(t),-1.5);}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colortwo);

//Add labels
label(minipage("\noindent\centering In plane\\ $y=0$"),(0,4,1.5));
draw((.1,4,1.5)--(3,0,2),linewidth(.75),Arrow3);
draw((-.1,4,1.5)--(-3,0,2),linewidth(.75),Arrow3);
label(minipage("\noindent\centering In plane\\ $z=d$"),(4,0,-1));
draw((4,0,-1)--(1.6,1.1,-1.5),linewidth(.75),Arrow3);
label(minipage("\noindent\centering In plane\\ $y=d$"),(4,0,-1),invisible);

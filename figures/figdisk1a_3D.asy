include apexconfig;

//ASY file for fig:disk2 in Chapter 7 section sec:disk

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((24.2,2.9,24.5),(0,1,0),(0,0,0),.95,(0.011,0.0033));

// setup and draw the axes
real[] myxchoice={-2,-1,1,2};
real[] myychoice={1};
real[] myzchoice={};
defaultpen(0.5mm);

pair xbounds=(-2.3,2.3);
pair ybounds=(-.2,1.2);
pair zbounds=(-2.3,2.3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

path3 p=circle((0,2/3,0),3/2,Y);
draw(surface(p), emissive(colortwofill));
draw(p,colortwo+.4mm);

triple g(real t) {return (t,1/t,0);}
path3 mypath=graph(g,1,2,operator ..);
draw(mypath,colorone+linewidth(2));

draw((0,2/3,0)--(1.5,2/3,0),black+.3mm);

label("$x=1/y$",(1,1,0),N);

triple pt=(1,.2,0);
draw(pt--(.75,.65,0),linewidth(.75),Arrow3);
label("$R(y)=1/y$",pt,S);

triple f(pair t) {return (1/t.x*cos(t.y),t.x,1/t.x*sin(t.y));}
surface s=surface(f,(.5,0),(1,2*pi),5,16,Spline);
draw(s,invisible);

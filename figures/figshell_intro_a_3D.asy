include apexconfig;

//ASY file for fig:shell_intro in Chapter 7 section sec:shell_method

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((13.6,14.55,43),(0,1,0),(0,0,0),1,(0,0));

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={1};
real[] myzchoice={};

pair xbounds=(-1.2,1.2);
pair ybounds=(-.2,1.2);
pair zbounds=(-1.2,1.2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple g1(real t) {return (t,1/(1+t^2),0);}
path3 p1=graph(g1,0,1,operator ..);
draw(p1--(1,0,0),colorone+.4mm);
//draw(surface(p1 -- (1,0,0)--(0,0,0)--cycle), emissive(rgb(.6,.6,1)+opacity(0.5)));

triple f(pair t) {return (cos(t.x),t.y,sin(t.x));}
surface s=surface(f,(0,0),(2*pi,.5),16,2,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

triple f(pair t) {return (cos(t.x)*t.y,1/(1+t.y^2),t.y*sin(t.x));}
surface s=surface(f,(0,0),(2*pi,1),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

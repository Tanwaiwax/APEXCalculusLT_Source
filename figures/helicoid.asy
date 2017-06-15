include apexconfig;

// asy file for fig:helicoid in sec:other_systems

size(200,200,IgnoreAspect);
currentprojection=orthographic(3,1,3);

// setup and draw the axes
real[] myxchoice={-2,-1,1,2};
real[] myychoice={-2,-1,1,2};
real[] myzchoice={5,10};

pair xbounds=(-2,2);
pair ybounds=(-2,2);
pair zbounds=(0,15);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f2(pair t) {return (cos(t.y)*t.x,sin(t.y)*t.x,t.y);}
surface s2=surface(f2,(0,0),(2,4*pi),4,16,Spline);
draw(s2,emissive(coloronefill),meshpen=colorone);

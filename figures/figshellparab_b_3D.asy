include apexconfig;

// asy file for fig:shell4 in 07_Shell_Method

size(200,200,IgnoreAspect);
currentprojection=orthographic((10.17,5.3,46),(0,1,0),(0,0,0),1,(-0.0999,0.0072));

// setup and draw the axes
real[] myxchoice={1,2,3};
real[] myychoice={1,2,3};
real[] myzchoice={};

pair xbounds=(-3,3);
pair ybounds=(-.1,3.2);
pair zbounds=(-3,3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


triple f2(pair t) {return (cos(t.y)*t.x,t.x,sin(t.y)*t.x);}
surface s2=surface(f2,(0,0),(2,2*pi),4,16,Spline);
draw(s2,emissive(coloronefill),meshpen=colorone);

triple f2(pair t) {return (cos(t.y)*t.x,t.x*(3-t.x),sin(t.y)*t.x);}
surface s2=surface(f2,(0,0),(2,2*pi),4,16,Spline);
draw(s2,emissive(coloronefill),meshpen=colorone);

triple g3(real t) {return (t,t*(3-t),0);}
path3 p3=graph(g3,0,2,operator ..);
draw(p3,black+.4mm);

path3 p3=(0,0,0)--(2,2,0);
draw(p3,black+.4mm);

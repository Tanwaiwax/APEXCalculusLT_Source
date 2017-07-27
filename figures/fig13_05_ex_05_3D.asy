include apexconfig;

//ASY file for 13_05_exset_01 in Chapter 13 sec:surface_area

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,1);

// setup and draw the axes
real[] myxchoice={5};
real[] myychoice={5};
real[] myzchoice={-1,1};

pair xbounds=(-0.5,7);
pair ybounds=(-0.5,7);
pair zbounds=(-2,2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,sin(t.x)*cos(t.y));
}
surface s=surface(f,(0,0),(2*pi,2*pi),12,12,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//lines in xy plane
draw((0,0,0)--(0,2*pi,0),colorone+dashed+linewidth(2));
draw((2*pi,0,0)--(2*pi,2*pi,0),colorone+dashed+linewidth(2));

//lines on surface
triple g(real t) {return (t,0,sin(t));}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colorone+dashed+linewidth(2));
triple g(real t) {return (t,2*pi,sin(t));}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colorone+dashed+linewidth(2));

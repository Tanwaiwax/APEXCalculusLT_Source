include apexconfig;

//ASY file for fig:double3 in Chapter 13 sec:double_int_volume

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(.92,4,3.7);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={1};
real[] myzchoice={-1,1};

pair xbounds=(-1.5,1.5);
pair ybounds=(0,1.5);
pair zbounds=(-1.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,sin(t.x)*cos(t.y));
}
surface s=surface(f,(-1.25,-0.25),(1.25,1.5),12,20,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw triangle in plane
draw((-1,0,0)--(1,0,0)--(0,1,0)--(-1,0,0),colorone+dashed+linewidth(0.75));
label("$R$",(0.8,0.25,0),E);

//Draw triangle on surface
triple g(real t) {return (t,0,sin(t));}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colorone+linewidth(2));

triple g(real t) {return (t-1,t,sin(t-1)*cos(t));}
path3 mypath=graph(g,0,1,operator ..);
draw(mypath,colorone+linewidth(2));

triple g(real t) {return (t,1-t,sin(t)*cos(1-t));}
path3 mypath=graph(g,0,1,operator ..);
draw(mypath,colorone+linewidth(2));

include apexconfig;

//ASY file for fig:torus in Chapter 13 section sec:divthm

size(200,100,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4.9,1.6,2.5);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-4.5,4.5);
pair ybounds=(-4.5,4.5);
pair zbounds=(-2.5,2.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return ( (3+cos(t.x))*cos(t.y), (3+cos(t.x))*sin(t.y), sin(t.x) );
}
surface s=surface(f,(0,0),(2*pi,2*pi),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

triple g(real x) {
  return ( (3+cos(x))*cos(pi/3),(3+cos(x))*sin(pi/3),sin(x) );
}
draw(graph(g,0,2*pi,operator ..),black);
draw((0,0,0)--(4*cos(pi/3),4*sin(pi/3),0),black+linewidth(1));
draw((3*cos(pi/3),3*sin(pi/3),0)--(3*cos(pi/3),3*sin(pi/3),1),black+linewidth(1));
draw((1,0,0)..(1,tan(pi/6),0)..(cos(pi/3),sin(pi/3),0),black+linewidth(1));

label("$v$",(.5,.5*tan(pi/6),0));
label("$a$",(3.5*cos(pi/3),3.5*sin(pi/3),.5),black+linewidth(1));

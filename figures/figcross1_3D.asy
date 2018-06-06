include apexconfig;

//ASY file for fig:cross1 in Chapter 7 section sec:disk

size(100,100,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(3.4,5.4,.9);

// setup and draw the axes
real[] myxchoice={1,2};
real[] myychoice={1,2,3};
real[] myzchoice={1};

pair xbounds=(-0.25,2.5);
pair ybounds=(-0.25,2.5);
pair zbounds=(-0.25,1.5);


triple f(pair t) {
  return (t.y*(cos(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x))+.5*sin(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x))),
  	 t.y*(sin(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x))),
	 0);
}
surface s=surface(f,(0,0),(2*pi,1),16,2,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

triple f(pair t) {
  return (cos(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x))+.5*sin(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x)),
  	 sin(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x)),
	 t.y);
}
surface s=surface(f,(0,0),(2*pi,1),16,2,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

triple f(pair t) {
  return (t.y*(cos(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x))+.5*sin(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x))),
  	 t.y*(sin(t.x)*(1.5+.5*cos(t.x)*sin(3*t.x))),
	 1);
}
surface s=surface(f,(0,0),(2*pi,1),16,2,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

triple g(real t) {
  return (cos(t)*(1.5+.5*cos(t)*sin(3*t))+.5*sin(t)*(1.5+.5*cos(t)*sin(3*t)),
  	 sin(t)*(1.5+.5*cos(t)*sin(3*t)),
	 1);
}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colorone+linewidth(2));

triple g(real t) {
  return (cos(t)*(1.5+.5*cos(t)*sin(3*t))+.5*sin(t)*(1.5+.5*cos(t)*sin(3*t)),
  	 sin(t)*(1.5+.5*cos(t)*sin(3*t)),
	 0);
}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colorone+linewidth(2));

label("base area $= A$",(2,2,-.1));
//label("Volume $=A\cdot h$",(2,2,-.4));
label("$h$",(-1.9,0,.5));

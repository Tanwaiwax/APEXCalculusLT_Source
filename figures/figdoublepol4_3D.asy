include apexconfig;

//ASY file for fig:doublepol4 in Chapter 12 sec:double_int_polar

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-2,2);
pair ybounds=(-2,2);
pair zbounds=(-2,2);

//xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
//yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
//zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

//label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
//label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

real z(real t) {return 1-(cos(3*t)*cos(t))+0.1*(cos(3*t)*sin(t));}

//plane is z=1-x+0.1y
triple f(pair t) {
  return (cos(3*t.x)*cos(t.x),cos(3*t.x)*sin(t.x),z(t.x)*t.y);
}
surface s=surface(f,(0,0),(2*pi,1),32,32,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//draw curve on xy plane
triple bottom(real t) {return (cos(3*t)*cos(t),cos(3*t)*sin(t),0);}
path3 bottompath=graph(bottom,0,pi,operator ..);
draw(bottompath,colorone+linewidth(2));
// shade in the loops
path3 loopA = graph(bottom,-pi/6,pi/6,operator ..)--cycle;
draw(surface(loopA),emissive(coloronefill));
path3 loopB = graph(bottom,-pi/2,-pi/6,operator ..)--cycle;
draw(surface(loopB),emissive(coloronefill));
path3 loopC = graph(bottom,pi/6,pi/2,operator ..)--cycle;
draw(surface(loopC),emissive(coloronefill));

//draw curves on surface
triple top(real t) {return (cos(3*t)*cos(t),cos(3*t)*sin(t),z(t));}
path3 mypath=graph(top,0,pi,operator ..);
draw(mypath,colorone+linewidth(2));
// shade in the loops
path3 loopA = graph(top,-pi/6,pi/6,operator ..)--cycle;
draw(surface(loopA),emissive(coloronefill));
path3 loopB = graph(top,-pi/2,-pi/6,operator ..)--cycle;
draw(surface(loopB),emissive(coloronefill));
path3 loopC = graph(top,pi/6,pi/2,operator ..)--cycle;
draw(surface(loopC),emissive(coloronefill));

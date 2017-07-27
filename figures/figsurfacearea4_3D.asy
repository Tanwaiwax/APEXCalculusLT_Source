include apexconfig;

//ASY file for fig:surfacearea4 in Chapter 13 sec:surface_area

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(5.3,17,74);

// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={-4,-2,2,4};
real[] myzchoice={20};

pair xbounds=(-.25,5);
pair ybounds=(-5,5);
pair zbounds=(-1,25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,t.x^2-3*t.y+3);
}
surface s=surface(f,(-0.25,-4.5),(4.5,4.5),12,12,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//triangle in xy plane
draw((0,0,0)--(4,4,0)--(4,-4,0)--cycle,colorone+dashed+linewidth(1));

//triangle on surface
triple g(real t) {return (t,t,t^2-3*t+3);}
path3 mypath=graph(g,0,4,operator ..);
draw(mypath,colorone+linewidth(2));
triple g(real t) {return (t,-t,t^2+3*t+3);}
path3 mypath=graph(g,0,4,operator ..);
draw(mypath,colorone+linewidth(2));
triple g(real t) {return (4,t,16-3*t+3);}
path3 mypath=graph(g,-4,4,operator ..);
draw(mypath,colorone+linewidth(2));

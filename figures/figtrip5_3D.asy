include apexconfig;

//ASY file for fig:trip5 in Chapter 13 sec:triple_int

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(8.4,6.8,12.6);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={5};

pair xbounds=(-2.5,2.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-0.5,7);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//paraboloid  6-2*t.x^2-t.y^2
triple f(pair t) {
  return (cos(t.x)*t.y,
  	  2*sin(t.x)*t.y,
	  6-(2*(cos(t.x)*t.y)^2+(2*sin(t.x)*t.y)^2));
}
surface s=surface(f,(0,0),(2*pi,1),16,8,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//parametric trough
triple f(pair t) {
  return (cos(t.x)*t.y,2*sin(t.x)*t.y,(2*(cos(t.x)*t.y)^2+2));
}
surface s=surface(f,(0,0),(2*pi,1),16,16,Spline);
draw(s,emissive(colortwofill),meshpen=colortwo);

//ellipse in xy plane
triple g(real t) {return (cos(t),2*sin(t),0);}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colorone+linewidth(2));

//ellipse up on the surface intersection
triple g(real t) {return (cos(t),2*sin(t),2*cos(t)^2+2);}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colorone+linewidth(2));

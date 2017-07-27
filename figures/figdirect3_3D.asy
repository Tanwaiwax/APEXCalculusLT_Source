include apexconfig;

//ASY file for fig:direct9 in Chapter 12 sec:directional_derivative

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(3.6,18.5,24);
defaultrender.merge=true;

// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={2,4};
real[] myzchoice={10,20};

pair xbounds=(-1,5);
pair ybounds=(-1,5);
pair zbounds=(-0.5,22);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=20-x^2-2y^2
triple f(pair t) {
  return (t.x,t.y,20-t.x^2-2*t.y^2);
}
//surface s=surface(f,(0,0),(4,4),16,16,Spline);

triple g(pair t) {
  return (sqrt(20)*cos(t.x)*t.y,sqrt(10)*sin(t.x)*t.y,
  	 20-20*t.y^2
//  	 20-(sqrt(20)*cos(t.x)*t.y)^2-2*(sqrt(10)*sin(t.x)*t.y)^2
	 );
}
surface ss=surface(g,(0,0),(pi/2,1),16,16,Spline);
draw(ss,emissive(coloronefill),meshpen=colorone);

//plot point on surface
dotfactor=3;
dot(f((1,1/4)));
//dot((1,1/4,18.875));

//Draw a trace on the surface
triple g(real t) {return (t,t^2/4,20-t^2-t^4/8);}
path3 mypath=graph(g,1,3.044,operator ..);
draw(mypath,colorone);

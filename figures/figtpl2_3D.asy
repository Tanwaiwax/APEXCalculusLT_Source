include apexconfig;

//ASY file for fig:tpl2 in Chapter 12 sec:multi_tangent

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(8,2.6,4.7);

// setup and draw the axes
real[] myxchoice={1,2};
real[] myychoice={1,2};
real[] myzchoice={2};

pair xbounds=(-0.5,2.5);
pair ybounds=(-0.5,2.5);
pair zbounds=(-3.5,3.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

real z(pair t) {return 4*t.x*t.y-t.x^4-t.y^4;}
bool above(pair t){return z(t)>-3;}

triple f(pair t) {
  return (t.x,t.y,z(t));
  // this was polar coordinates about (1,1)
//  return (cos(t.x)*t.y+1,
//  	 sin(t.x)*t.y+1,
//  	 4*(cos(t.x)*t.y+1)*(sin(t.x)*t.y+1)-(cos(t.x)*t.y+1)^4-(sin(t.x)*t.y+1)^4);
}
surface s=surface(f,(0,0),(2,2),16,16,above);
//surface s=surface(f,(0,0),(2*pi,.75),32,32,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//plot point on surface
dotfactor=3;
dot((1,1,2));

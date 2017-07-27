include apexconfig;

//ASY file for fig:multi_extreme1 in Chapter 12 sec:multi_extreme_values

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={2};
real[] myzchoice={5};

pair xbounds=(-3,3);
pair ybounds=(-3,3);
pair zbounds=(-1,6);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=x^2+y^2-xy-x-2
triple f(pair t) {
  return (t.x,t.y,t.x^2+t.y^2-t.x*t.y-t.x-2);
}
surface s=surface(f,(-1,-1),(2,2),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//plot point on surface
dotfactor=4;
dot(f((2/3,1/3)));

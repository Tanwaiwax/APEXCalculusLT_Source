include apexconfig;

//ASY file for fig:multi_extreme5 in Chapter 12 sec:multi_extreme_values

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(24,.7,11.5);

// setup and draw the axes
real[] myxchoice={-2};
real[] myychoice={-0.2,0.2,0.4};
real[] myzchoice={};

pair xbounds=(-3,3);
pair ybounds=(-0.3,0.5);
pair zbounds=(-1,2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=x^2y+y^2+xy
triple f(pair t) {
  return (t.x,t.y,t.x^2*t.y+t.y^2+t.x*t.y);
}
surface s=surface(f,(-2,-0.3),(1.5,0.5),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//plot point on surface
dotfactor=4;
dot((0,0,0));
dot((-1,0,0));
dot((-1/2,1/8,-.016));

include apexconfig;

//ASY file for fig:direct9 in Chapter 12 sec:directional_derivative

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(9,3.3,3.2);

// setup and draw the axes
real[] myxchoice={1,2};
real[] myychoice={1,2};
real[] myzchoice={2};

pair xbounds=(-0.5,2.5);
pair ybounds=(-0.5,2.5);
pair zbounds=(-0.5,3.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=-x^2+2x-y^2+2y+1  -x^2-y^2+2*x+2*y+1
triple f(pair t) {
  return (t.x,t.y,-t.x^2+2*t.x-t.y^2+2*t.y+1);
}
surface s=surface(f,(0,0),(2,2),16,16,
	usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
	vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=colorone);

//plot point on surface
dotfactor=4;
dot((1,1,3));

label("$P$",(1,1,3),N);

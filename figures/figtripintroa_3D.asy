include apexconfig;

//ASY file for fig:tripintro in Chapter 13 sec:triple_int

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(0,2.25);
pair ybounds=(0.25,1.75);
pair zbounds=(-0.5,0.5);

//xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
//zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

//label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Ellipsoid
triple f(pair t) {
  return (cos(t.x)*2*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
}
surface s=surface(f,(pi/6,-pi/3),(2*pi/3,pi/3),8,8,
	usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
	vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=colorone);

//draw red cube
draw((0.13,1.05,0.26)--(0.13,1.05,0)--(-0.26,1.05,0)--(-0.25,1.05,0.26)--cycle,colortwo);//front
draw((0.13,0.9,0.26) -- (0.13, 0.9, 0) -- (-0.26, 0.9, 0) -- (-0.25, 0.9, 0.26)--cycle,colortwo);//back

//sides
draw((0.13, 0.9, 0.26)--(0.13, 1.05, 0.26),colortwo);
draw((0.13, 0.9, 0)--(0.13, 1.05, 0),colortwo);
draw((-0.26, 0.9, 0)--(-0.26, 1.05, 0),colortwo);
draw((-0.25, 0.9, 0.26)--(-0.25, 1.05, 0.26),colortwo);

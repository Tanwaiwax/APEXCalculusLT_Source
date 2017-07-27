include apexconfig;

//ASY file for fig:partialintro in Chapter 12 sec:partial_derivatives

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(16,16,36);

// setup and draw the axes
real[] myxchoice={-4,-2,2,4};
real[] myychoice={-4,-2,2,4};
real[] myzchoice={10,20};

pair xbounds=(-5,5);
pair ybounds=(-5,5);
pair zbounds=(-1,22);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=x^2+2*y^2
triple f(pair t) {
  return (t.x,t.y,t.x^2+2*t.y^2);
}
surface s=surface(f,(-3,-3),(3,3),16,16,
	usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
	vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw the trace for y=2
triple g(real t) {return (t,2,t^2+8);}
path3 mypath=graph(g,-3,3,operator ..);
draw(mypath,colorone);

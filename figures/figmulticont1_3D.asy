include apexconfig;

//ASY file for fig:multicont1 in Chapter 12 sec:multi_chain

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(31,31,2.3);

// setup and draw the axes
real[] myxchoice={-10,10};
real[] myychoice={-10,10};
real[] myzchoice={-1,1};

pair xbounds=(-12,12);
pair ybounds=(-12,12);
pair zbounds=(-1.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,cos(t.y)*sin(t.x)/t.x);
}
surface s=surface(f,(-10,-10),(10,10),15,15,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

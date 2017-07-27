include apexconfig;

//ASY file for fig:surfacearea3 in Chapter 13 sec:surface_area

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-2.5,2.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-0.25,3.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x*cos(t.y),t.x*sin(t.y),1.5*(2-t.x));
}
surface s=surface(f,(0,0),(2,2*pi),12,12,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//labels a and h
label("$h$",(.2,-.2,3));
label("$a$",(2.2,.2,0));
label("$a$",(.2,2.2,0));

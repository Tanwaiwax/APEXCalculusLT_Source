include apexconfig;

//ASY file for fig:trip1 in Chapter 13 sec:triple_int

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(5.4,-12.7,20.2);

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={2,4};
real[] myzchoice={-5,5};

pair xbounds=(-0.5,3);
pair ybounds=(-0.5,5);
pair zbounds=(-5.25,10);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,3*t.x+t.y-4);
}
surface s=surface(f,(0,0),(2,4),1,1,Spline);
draw(s,emissive(coloronefill),meshpen=colorone+linewidth(1.5));

triple f(pair t) {
  return (t.x,t.y,8-3*t.x-2*t.y);
}
surface s=surface(f,(0,0),(2,4),1,1,Spline);
draw(s,emissive(colortwofill),meshpen=colortwo+linewidth(1.5));

draw((0,4,0)--(2,0,2),.5*colorone+.5*colortwo+dashed+linewidth(1.5));

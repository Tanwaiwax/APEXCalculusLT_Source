include apexconfig;

//ASY file for fig:tpl8 in Chapter 12 sec:multi_tangent

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(14,11,4.7);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={-2,2};

pair xbounds=(-3.5,3.5);
pair ybounds=(-3.5,3.5);
pair zbounds=(-3.5,3.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (cos(t.y)*sqrt(12)*cos(t.x),cos(t.y)*sqrt(6)*sin(t.x),2*sin(t.y));
}
surface s=surface(f,(-pi,-pi/2),(pi,pi/2),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//plot point on surface
dotfactor=3;
dot((1,2,1));

// .5(z-1) = (x-1)/6 + 2(y-2)/3
// z-1 = (x-1)/3 + 4(y-2)/3
// z = 1+(x-1)/3 + 4(y-2)/3
triple g(pair t) {
       return (t.x+1,t.y+2,1+t.x/3+4*t.y/3); // centered at x=y=1
}
surface ss=surface(g,(-1.5,-.75),(1.5,.75),1,1);
draw(ss,emissive(colortwofill),meshpen=colortwo);

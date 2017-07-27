include apexconfig;

//ASY file for fig:partial4 in Chapter 12 sec:multi_tangent

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={2,4};
real[] myzchoice={-1,1};

pair xbounds=(-0.5,5);
pair ybounds=(-0.5,4.5);
pair zbounds=(-1.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,sin(t.x)*cos(t.y));
}
surface s=surface(f,(-1,-1),(4,4),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//plot point on surface
dotfactor=3;
dot((pi/2,pi/2,0));

//Draw traces on the surface
triple g(real t) {return (t,pi-t,sin(t)*cos(pi-t));}
path3 mypath=graph(g,0,3.75,operator ..);
draw(mypath,colorone);

//Draw lines on the surface 
//L1 = (pi/2,pi/2,0)+t(-0.707,0.707,-0.707) for t=-1,1
draw((2.28,.864,0.707)--(.864,2.28,-0.707),colortwo);

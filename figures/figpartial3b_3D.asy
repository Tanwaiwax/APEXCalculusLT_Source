include apexconfig;

//ASY file for fig:partial3 in Chapter 12 sec:partial_derivatives

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(8,8,10);

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={2};
real[] myzchoice={5,10};

pair xbounds=(-1,3);
pair ybounds=(-1,3);
pair zbounds=(-1,12);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=-x^2-(1/2)*y^2+xy+10
triple f(pair t) {
  return (t.x,t.y,-t.x^2-(1/2)*t.y^2+t.x*t.y+10);
}
surface s=surface(f,(0,0),(3,3),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);


//Draw the point (2,1,7.5) trace for x=2
dotfactor=3;dot((2,1,7.5));
triple g(real t) {return (2,t,-4-(1/2)*t^2+2*t+10);}
path3 mypath=graph(g,0,3,operator ..);
draw(mypath,colorone);

//Draw the tan line (x=2) L=(2,1,7.5)+t(0,1,1) for t=-1,2
draw((2,0,6.5)--(2,3,9.5),colortwo);

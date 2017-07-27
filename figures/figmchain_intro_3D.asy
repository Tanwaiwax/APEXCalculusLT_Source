include apexconfig;

//ASY file for fig:mchain_intro in Chapter 12 sec:multi_chain

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={2,4};
real[] myzchoice={2};

pair xbounds=(-1,5);
pair ybounds=(-1,5);
pair zbounds=(0,3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,-0.2*(t.x-1)^2-0.05*t.y^2+2);
}
surface s=surface(f,(0,0),(4,4),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

draw(circle((2,2,0),1,Z),dashed+colorone+linewidth(.75));

//Draw the circle on surface
triple g(real t) {
  return (cos(t)+2,
  	  sin(t)+2,
  	  -0.2*(cos(t)+2-1)^2-0.05*(sin(t)+2)^2+2);
}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colorone);

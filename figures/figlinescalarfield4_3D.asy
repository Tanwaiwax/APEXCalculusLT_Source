include apexconfig;

// ASY file for fig:linescalarfield4 in Section 14.1

// The path is an elliptical helix <cos t, 2sin t, t/pi>; no specific surface.

size(200,200,IgnoreAspect);
currentprojection=orthographic(9.8,10.4,5.5);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={2};
pair xbounds=(-2.2,2.2);
pair ybounds=(-2.2,2.2);
pair zbounds=(-.1,2.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface
triple f(pair t) {
	return (cos(t.x),2sin(t.x),t.y*(t.x/pi));
}
surface s=surface(f,(0,0),(2pi,1),16,4,Spline);
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

triple g(real t) {return (cos(t),2sin(t),t/pi);}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,colorone+linewidth(2));

triple g(real t) {return (cos(t),2sin(t),0);}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,colorone+linewidth(2)+dashed);

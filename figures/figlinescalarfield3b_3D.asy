include apexconfig;

// ASY file for fig:linescalarfield3 in Section 14.1
// The surface is z=x^2-y^2+3; the path is the unit circle.

size(200,200,IgnoreAspect);
currentprojection=orthographic(7.5,9,8);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-1,1};
real[] myzchoice={4};
pair xbounds=(-1.2,1.2);
pair ybounds=(-1.2,1.2);
pair zbounds=(-.1,4.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface z=x^2-y^2+3
triple f(pair t) {
	return (cos(t.x),sin(t.x),t.y*(cos(t.x)^2-sin(t.x)^2+3));
}
surface s=surface(f,(0,0),(2pi,1),16,8,Spline);
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

triple g(real t) {return (cos(t),sin(t),cos(t)^2-sin(t)^2+3);}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,colorone+linewidth(2));

triple g(real t) {return (cos(t),sin(t),0);}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,colorone+linewidth(2)+dashed);

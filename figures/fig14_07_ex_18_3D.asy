include apexconfig;

//ASY file for 14.7 exset 4

size(200,200,IgnoreAspect);
currentprojection=orthographic(14,14,10);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={6};

pair xbounds=(-2.5,2.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-.25,6.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.y*cos(t.x),t.y*sin(t.x),(t.y*cos(t.x))^2+(t.y*sin(t.x))^3-3t.y*sin(t.x)+1);//
}
surface s=surface(f,(0,0),(2pi,2),16,8,Spline);
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

triple g(real t) {return (2cos(t),2sin(t),4cos(t)^2+8sin(t)^3-6sin(t)+1);}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,colorone+linewidth(2));

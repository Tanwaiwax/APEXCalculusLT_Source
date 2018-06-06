include apexconfig;

//ASY file for 14.7 exset 4

size(200,200,IgnoreAspect);
currentprojection=orthographic(14,14,10);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={10};

pair xbounds=(-2.5,2.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-.25,11);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.y*cos(t.x),3*t.y*sin(t.x),-(t.y*cos(t.x))*2-3*(t.y*sin(t.x))+5);//
}
surface s=surface(f,(0,0),(2pi,1),16,8,Spline);
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

triple g(real t) {return (cos(t),3sin(t),-2cos(t)-3sin(t)+5);}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,colorone+linewidth(2));

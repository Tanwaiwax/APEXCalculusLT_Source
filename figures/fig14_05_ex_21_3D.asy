include apexconfig;

//ASY file for Exercise 14.5#13 in Chapter 14

size(200,200,IgnoreAspect);
currentprojection=orthographic(14,14,4);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-3,3};
real[] myzchoice={1,3};

pair xbounds=(-3.5,3.5);
pair ybounds=(-3.5,3.5);
pair zbounds=(-0.25,3.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple g(real t) {return (cos(t),3sin(t),3);}
path3 mypath=graph(g,0,2pi,operator ..);draw(mypath,colorone+linewidth(2));

triple g(real t) {return (cos(t),3sin(t),1);}
path3 mypath=graph(g,0,2pi,operator ..);draw(mypath,colorone+linewidth(2));

//Draw paraboloid over unit disk
triple f(pair t) {
	return (cos(t.x),3*sin(t.x),t.y);//
}
surface s=surface(f,(0,1),(2pi,3),16,8,Spline);
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (t.y*cos(t.x),t.y*3*sin(t.x),1);//
}
surface s=surface(f,(0,0),(2pi,1),16,2,Spline);
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (t.y*cos(t.x),t.y*3*sin(t.x),3);//
}
surface s=surface(f,(0,0),(2pi,1),16,2,Spline);
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

//label and arrow
label("$x+y^2/9=1$",(2.5,0,1));
draw((2.25,0,1.25)--(1,0,2),Arrow3(size=2mm));

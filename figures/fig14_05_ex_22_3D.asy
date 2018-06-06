include apexconfig;

//ASY file for Exercise 14.5#14

size(200,200,IgnoreAspect);
currentprojection=orthographic(14,14,4);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-1,1};
real[] myzchoice={1};
defaultpen(0.5mm);

pair xbounds=(-1.5,1.5);
pair ybounds=(-1.5,1.5);
pair zbounds=(-0.25,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple g(real t) {return (cos(t),sin(t),0);}
path3 mypath=graph(g,0,2pi,operator ..);draw(mypath,colorone+linewidth(2));

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.y*cos(t.x),t.y*sin(t.x),1-t.y);//
}
surface s=surface(f,(0,0),(2pi,1),16,8,Spline);
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (t.y*cos(t.x),t.y*sin(t.x),0);//
}
surface s=surface(f,(0,0),(2pi,1),16,2,Spline);
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

//label and arrow
label("$x^2+y^2=(z-1)^2$",(1,0,1));
draw((.9,0,.9)--(.55,0,.5),Arrow3(size=2mm));

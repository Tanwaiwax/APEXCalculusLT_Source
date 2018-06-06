include apexconfig;

//ASY file for Exercise 14.5#16

size(200,200,IgnoreAspect);
currentprojection=orthographic(14,14,8);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={4};

pair xbounds=(-2.5,2.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-0.25,4.75);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw paraboloid over unit disk
triple f(pair t) {
	return (2*t.y*cos(t.x),t.y*sin(t.x),4-(2*t.y*cos(t.x))^2-4(t.y*sin(t.x))^2);//
}
surface s=surface(f,(0,0),(2pi,1),16,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

//Draw paraboloid over unit disk
triple f(pair t) {
	return (2*t.y*cos(t.x),t.y*sin(t.x),0);//
}
surface s=surface(f,(0,0),(2pi,1),16,2,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

triple g(real t) {return (2cos(t),sin(t),0);}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,colorone+linewidth(2));

//label and arrow
label("$z=4-x^2-4y^2$",(0,1.5,3));
draw((0,1.45,2.9)--(0,1,1),Arrow3(size=2mm));

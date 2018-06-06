include apexconfig;

//ASY file for Exercise 14.5#11 and 14.7 exset 3

size(200,200,IgnoreAspect);
currentprojection=orthographic(12.1,-7.1,16);

// setup and draw the axes
real[] myxchoice={-2,-1,1,2};
real[] myychoice={1,2,3,4};
real[] myzchoice={2,4,6,8};

pair xbounds=(-2.5,2.5);
pair ybounds=(-0.25,5);
pair zbounds=(-0.25,10);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//parabola in plane
triple g(real t) {return (t,4-t^2,0);}
path3 mypath=graph(g,-2,2,operator ..);draw(mypath,colorone+linewidth(2));
triple g(real t) {return (t,4-t^2,2*(4-t^2));}
path3 mypath=graph(g,-2,2,operator ..);draw(mypath,colorone+linewidth(2));

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x,t.y*(4-t.x^2),2*t.y*(4-t.x^2));//
}
surface s=surface(f,(-2,0),(2,1),16,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x,(4-t.x^2),2*t.y*(4-t.x^2));//
}
surface s=surface(f,(-2,0),(2,1),16,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x,t.y*(4-t.x^2),0);//
}
surface s=surface(f,(-2,0),(2,1),16,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

//label and arrow
label("$z=2y$",(-2,2,7));
draw((-1.8,2,6.8)--(-1,2,4.1),Arrow3(size=2mm));
label("$y=4-x^2$",(2.5,2,0));
draw((2.3,2.5,0.2)--(1.55,2.25,2.5),Arrow3(size=2mm));

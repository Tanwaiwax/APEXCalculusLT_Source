include apexconfig;

//ASY file for fig:parsurf7 in Section 14.5

size(200,200,IgnoreAspect);
currentprojection=orthographic(20.4,10,4.6);

// setup and draw the axes
real[] myxchoice={-5,5};
real[] myychoice={-1,1};
real[] myzchoice={-2,2};

pair xbounds=(-6,6);
pair ybounds=(-3,3);
pair zbounds=(-3,3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the ellipoid  x^2/25+y^2+z^2/4=1
triple f(pair t) {
	return (5*cos(t.y)*sin(t.x),sin(t.y)*sin(t.x),2cos(t.x));//
}
surface s=surface(f,(0,0),(pi,2pi),16,16,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

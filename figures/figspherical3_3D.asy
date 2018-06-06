include apexconfig;

//ASY file for fig:spherical3 in Section 13.7

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(12,13,3);

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={2};
real[] myzchoice={4};

pair xbounds=(-2.5,2.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-.1,5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the sides of the cone
triple f(pair t) {
	return (t.y*cos(t.x)*sin(pi/6),t.y*sin(t.x)*sin(pi/6),t.y*cos(pi/6));//
}
surface s=surface(f,(0,0),(2*pi,4),16,4,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone+.1mm;
draw(s,emissive(coloronefill),meshpen=p);

//Draw the cap
triple f(pair t) {
	return (4*cos(t.x)*sin(t.y),4*sin(t.x)*sin(t.y),4*cos(t.y));//
}
surface s=surface(f,(0,0),(2*pi,pi/6),16,4,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

dot((0,0,2.799),black+1.2mm);

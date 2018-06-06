include apexconfig;

//ASY file for fig:simply_connected_space in Section 14.3

size(200,200);
currentprojection=orthographic(0,-5,3);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={1};
real[] myzchoice={1,2};
defaultpen(0.5mm);
pair xbounds=(-1.1,1.1);
pair ybounds=(-1.1,1.1);
pair zbounds=(-1.1,1.1);

//Draw the surface z^2+x^2+y^2=1, a sphere
triple f(pair t) {
	return (cos(t.x)*sin(t.y)-1.1,sin(t.x)*sin(t.y),cos(t.y));
}
surface s=surface(f,(0,1/4),(2pi,pi-1/4),16,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

//Draw the surface z^2+x^2+y^2=1, a sphere
triple f(pair t) {
	return (cos(t.x)*sin(.25)-1.1,sin(t.x)*sin(.25),cos(.25)+t.y*(cos(pi-.25)-cos(.25)));
}
surface s=surface(f,(0,0),(2pi,1),16,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

triple g(real t) {return (cos(t)-1.1, sin(t),0);}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,colortwo+linewidth(1));

//Draw the torus
real cc=.75;
real aa=.25;
triple f(pair t) {
	return ((cc+aa*cos(t.y))*cos(t.x)+1.1,(cc+aa*cos(t.y))*sin(t.x),aa*sin(t.y));
}
surface s=surface(f,(0,0),(2pi,2pi),16,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

triple g(real t) {return (cos(t)+1.1,sin(t),0);}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,colortwo+linewidth(1));

real yy = 5pi/4;

triple g(real t) {return ((cc+aa*cos(t))*cos(yy)+1.1,(cc+aa*cos(t))*sin(yy),aa*sin(t));}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,colortwo+linewidth(1));

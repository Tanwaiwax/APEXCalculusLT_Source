include apexconfig;

//ASY file for fig:simply_connected_space in Section 14.3

size(200,200);
currentprojection=orthographic(0,-5,3);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={1};
real[] myzchoice={1,2};
pair xbounds=(-1.1,1.1);
pair ybounds=(-1.1,1.1);
pair zbounds=(-1.1,1.1);

//Draw the surface z^2+x^2+y^2=1, a sphere shifted
triple f(pair t) {
	return (cos(t.x)*sin(t.y)-1.1,sin(t.x)*sin(t.y),cos(t.y));
}
surface s=surface(f,(0,0),(2pi,pi),16,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

//Draw the surface z^2+x^2+y^2=1, a sphere shifted
triple f(pair t) {
	return (cos(t.x)*sin(t.y)+1.1,sin(t.x)*sin(t.y),cos(t.y));
}
surface s=surface(f,(0,0),(2pi,pi),16,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

//Draw the surface z^2+x^2+y^2=1, a smaller sphere shifted
triple f(pair t) {
	return (.3*cos(t.x)*sin(t.y)+1.1,.3*sin(t.x)*sin(t.y),.3*cos(t.y));
}
surface s=surface(f,(0,0),(2pi,pi),16,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

triple g(real t) {return (t,t^2,-cos(t)*sin(t^2)+1);}
path3 mypath=graph(g,-1,1,operator ..);

triple g(real t) {return (t,t^2,0);}
path3 mypath=graph(g,-1,1,operator ..);

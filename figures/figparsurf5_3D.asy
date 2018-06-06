include apexconfig;

//ASY file for fig:parsurf5 in Section 14.5

size(200,200,IgnoreAspect);
currentprojection=orthographic(20.4,10,4.6);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={-2,2};

pair xbounds=(-2.5,2.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-2.5,2.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the cylinder  x^2+z^2/4=1
triple f(pair t) {
	return (cos(t.x),t.y,2sin(t.x));//
}
surface s=surface(f,(0,-1),(2pi,2),16,16,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

pen curvepen=.3mm+colorone;
triple g(real t) {return(cos(t),-1,2sin(t));}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,curvepen);

triple g(real t) {return(cos(t),2,2sin(t));}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,curvepen);

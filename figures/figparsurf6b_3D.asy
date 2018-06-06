include apexconfig;

//ASY file for fig:parsurf6b in Section 14.5

size(200,200,IgnoreAspect);
currentprojection=orthographic(20.4,10,4.6);

// setup and draw the axes
real[] myxchoice={-10,-5,5,10};
real[] myychoice={-10,-5,5,10};
real[] myzchoice={-3,3};

pair xbounds=(-10.5,10.5);
pair ybounds=(-10.5,10.5);
pair zbounds=(-3.5,3.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the cone  z^2=x^2/4+y^2/9
triple f(pair t) {
	return (2*t.y*cos(t.x),3*t.y*sin(t.x),t.y);//
}
surface s=surface(f,(0,-2),(pi,3),16,16,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

pen curvepen=.3mm+colorone;
triple g(real t) {return(-4cos(t),-6sin(t),-2);}
path3 mypath=graph(g,0,pi,operator ..);
draw(mypath,curvepen);

triple g(real t) {return(6cos(t),9sin(t),3);}
path3 mypath=graph(g,0,pi,operator ..);
draw(mypath,curvepen);

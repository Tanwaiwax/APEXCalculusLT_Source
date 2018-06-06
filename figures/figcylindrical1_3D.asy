include apexconfig;

//ASY file for fig:cylindrical1 in Section 13.7

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(27,12,10);

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={1};
real[] myzchoice={1,2};
defaultpen(0.5mm);

pair xbounds=(-2,2);
pair ybounds=(-2,2);
pair zbounds=(-.5,2.75);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the plane  z=2
triple f(pair t) {
	return (t.x,t.y,2);//
}
surface s=surface(f,(-1.5,-1.5),(1.5,1.5),8,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone+.1mm;
draw(s,emissive(coloronefill),meshpen=p);

draw((-1.5,-1.5,2) -- (-1.5,1.5,2) -- (1.5,1.5,2) -- (1.5,-1.5,2) -- (-1.5,-1.5,2),colorone+.25mm);

//Draw the plane  theta=pi/3
triple f(pair t) {
	return (t.x,t.x*sqrt(3),t.y);//
}
surface s=surface(f,(0,-.5),(1.25,2.25),8,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen q=colortwo+.1mm;
draw(s,emissive(colortwofill),meshpen=q);

draw((0,0,-.5) -- (1.25,1.25*sqrt(3),-.5) -- (1.25,1.25*sqrt(3),2.25) -- (0,0,2.25) -- (0,0,-.5),colortwo+.25mm);

//Draw the cylinder r=1
triple f(pair t) {
	return (cos(t.x),sin(t.x),t.y);//
}
surface s=surface(f,(0,-.5),(2*pi,2.25),16,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen q=colorthree+.1mm;

draw(s,emissive(colorthreefill),meshpen=q);

draw((.5,sqrt(3)*.5,-.5)--(.5,sqrt(3)*.5,2.25));

triple g(real t) {return (cos(t),sin(t),2);}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,black);

triple g(real t) {return (cos(t),sin(t),2.25);}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colorthree+.25mm);

triple g(real t) {return (cos(t),sin(t),-.5);}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colorthree+.25mm);

triple g(real t) {return (t,sqrt(3)*t,2);}
path3 mypath=graph(g,0,.866,operator ..);
draw(mypath,black);

label("$z=2$",(-1.25,1.25,2.3));
label("$r=1$",(1.1*cos(pi/6),1.1*sin(pi/6),-.75));
label("$\theta=\frac{\pi}{3}$",(1.25,1.25*sqrt(3),1));

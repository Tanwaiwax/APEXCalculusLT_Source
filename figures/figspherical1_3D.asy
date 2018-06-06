include apexconfig;

//ASY file for fig:spherical1 in Section 13.7

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(27,13,9);

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={1};
real[] myzchoice={1};

pair xbounds=(-2,2);
pair ybounds=(-2,2);
pair zbounds=(-1.5,2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the cone phi=pi/6
triple f(pair t) {
	return (t.y*cos(t.x),t.y*sin(t.x),sqrt(3)*t.y);//
}
surface s=surface(f,(0,0),(2*pi,1.5/sqrt(3)),16,4,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone+.1mm;
draw(s,emissive(coloronefill),meshpen=p);

triple g(real t) {return (1.5/sqrt(3)*cos(t),1.5/sqrt(3)*sin(t),1.5);}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colorone);

//Draw the plane theta=pi/3
triple f(pair t) {
	return (t.x,t.x*sqrt(3),t.y);//
}
surface s=surface(f,(0,-1.25),(1.25,1.5),4,4,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen q=colortwo;
draw(s,emissive(colortwofill),meshpen=q);

draw((0,0,-1.25) -- (1.25,1.25*sqrt(3),-1.25) -- (1.25,1.25*sqrt(3),1.5) -- (0,0,1.5) -- (0,0,-1.5),colortwo);

//Draw the sphere rho=1
triple f(pair t) {
	return (sin(t.y)*cos(t.x),sin(t.y)*sin(t.x),cos(t.y));//
}
surface s=surface(f,(0,0),(2*pi,pi),16,16,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen q=colorthree+.1mm;
draw(s,emissive(colorthreefill),meshpen=q);

triple g(real t) {return (1/2*cos(t),1/2*sin(t),1/2*sqrt(3));}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,black);

draw((0,0,0) -- (1.5/sqrt(3)*cos(pi/3),1.5/sqrt(3)*sin(pi/3),1.5));

triple g(real t) {return (sin(t)*cos(pi/3),sin(t)*sin(pi/3),cos(t));}
path3 mypath=graph(g,0,pi,operator ..);
draw(mypath,black);

triple g(real t) {return (cos(t),sin(t),-.5);}
path3 mypath=graph(g,0,2*pi,operator ..);

triple g(real t) {return (t,sqrt(3)*t,2);}
path3 mypath=graph(g,-.866,.866,operator ..);

label("$\varphi=\frac{\pi}{6}$",(1.5/sqrt(3)*cos(2pi/3),1.5/sqrt(3)*sin(2pi/3),1.5),E);
label("$\rho=1$",(1.1*cos(pi/200),1.1*sin(pi/200),-.9));
label("$\theta=\frac{\pi}{3}$",(1.25,1.25*sqrt(3),1));

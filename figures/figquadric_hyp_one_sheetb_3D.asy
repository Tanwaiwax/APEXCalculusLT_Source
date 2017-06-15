include apexconfig;

//ASY file for quadric library in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-2,2);
pair ybounds=(-2,2);
pair zbounds=(-2,2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

xaxis3("",-3,3,invisible,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",-3,3,invisible,OutTicks(myychoice),Arrow3(size=3mm));
//zaxis3("",-3,3,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface z^2 = x^2/(1.5)^2+y^2
triple f(pair t) {
	return (cos(t.y)/cos(t.x),sin(t.y)/cos(t.x),tan(t.x));//({cos(y)*sec(x)},{sec(x)*sin(y)},{tan(x)});
}
surface s=surface(f,(-1,0),(1,2*pi),32,16,
		usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
		vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw the traces for x=0
triple g(real t) {return (0,1/cos(t),tan(t));}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colortwo);
triple g(real t) {return (0,-1/cos(t),tan(t));}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colortwo);

//Draw the traces for y=0
triple g(real t) {return (1/cos(t),0,tan(t));}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colortwo);
triple g(real t) {return (-1/cos(t),0,tan(t));}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colortwo);

//Draw the traces for z=0 in red
//triple g(real t) {return (cos(t),sin(t),0);}
//path3 mypath=graph(g,0,2*pi,operator ..);
draw(circle(O,1,Z),colortwo);

//Add labels
label(minipage("\noindent\centering In plane\\ $y=0$"),(2,0,-1),S);
draw((2,0,-1)--(1.2,0,-.5),linewidth(.75),Arrow3);
label(minipage("\noindent\centering In plane\\ $x=0$"),(0,2,-.5),S);
draw((0,2,-.5)--(0,1.2,-.5),linewidth(.75),Arrow3);
label(minipage("\noindent\centering In plane\\ $z=0$"),(-1.6,1.6,.4),N);
draw((-1.6,1.6,.4)--(-.75,.75,0),linewidth(.75),Arrow3);

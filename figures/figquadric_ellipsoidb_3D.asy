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
zaxis3("",-3,3,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface z^2 = x^2/(1.5)^2+y^2
triple f(pair t) {
	return (1.5*cos(t.y)*cos(t.x),cos(t.y)*sin(t.x),sin(t.y));
}
surface s=surface(f,(-pi,-pi/2),(1*pi,pi/2),32,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw the trace for x=0
triple g(real t) {return (0,sin(t),cos(t));}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colortwo);
//Draw the trace for y=0
triple g(real t) {return (1.5*sin(t),0,cos(t));}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colortwo);
//Draw the trace for z=0
triple g(real t) {return (1.5*sin(t),cos(t),0);}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colortwo);

//Add labels
label(minipage("\noindent\centering In plane\\ $y=0$"),(2,0,-1),S);
draw((2,0,-1)--(1.3,0,-.5),linewidth(.75),Arrow3);
label(minipage("\noindent\centering In plane\\ $x=0$"),(0,2,-.5),S);
draw((0,2,-.5)--(0,.86,-.5),linewidth(.75),Arrow3);
label(minipage("\noindent\centering In plane\\ $z=0$"),(0,2,1.5),N);
draw((0,2,1.5)--(1.05,.75,0),linewidth(.75),Arrow3);

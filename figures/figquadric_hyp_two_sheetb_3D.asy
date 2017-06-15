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

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface z^2 - x^2 - y^2=1
triple f(pair t) {
	return (cos(t.y)*tan(t.x),sin(t.y)*tan(t.x),1/cos(t.x));
}
surface s=surface(f,(-1,0),(1,pi),32,16);
draw(s,emissive(coloronefill),meshpen=colorone);

triple f(pair t) {
	return (cos(t.y)*tan(t.x),sin(t.y)*tan(t.x),-1/cos(t.x));
}
surface s=surface(f,(-1,0),(1,pi),32,16);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw the traces for x=0
triple g(real t) {return (0,tan(t),1/cos(t));}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colortwo);
triple g(real t) {return (0,tan(t),-1/cos(t));}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colortwo);

//Draw the traces for y=0
triple g(real t) {return (tan(t),0,1/cos(t));}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colortwo);
triple g(real t) {return (tan(t),0,-1/cos(t));}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colortwo);

draw(circle((0,0,-1.7),1.37,Z),colortwo);

label(minipage("\noindent\centering In plane\\ $y=0$"),(1.5,0,-1),N);
draw((1.5,0,-1)--(1,0,-1.35),linewidth(.75),Arrow3);
label(minipage("\noindent\centering In plane\\ $x=0$"),(0,1.5,-1),N);
draw((0,1.5,-1)--(0,1,-1.35),linewidth(.75),Arrow3);
label(minipage("\noindent\centering In plane\\ $z=d$"),(1.1,1.1,-2),S);
draw((1.1,1.1,-2)--(.95,.95,-1.7),linewidth(.75),Arrow3);

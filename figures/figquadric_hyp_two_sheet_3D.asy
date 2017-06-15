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

label(minipage("\noindent\centering In plane\\ $y=0$"),(1.5,0,-1),N,invisible);
label(minipage("\noindent\centering In plane\\ $x=0$"),(0,1.5,-1),N,invisible);
label(minipage("\noindent\centering In plane\\ $z=d$"),(1.1,1.1,-2),S,invisible);

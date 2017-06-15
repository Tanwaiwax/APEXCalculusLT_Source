include apexconfig;

//ASY file for fig:space6 in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,9.5,5.7);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-3,3};
real[] myzchoice={-3,3};

pair xbounds=(-1.5,1.5);
pair ybounds=(-3.5,3.5);
pair zbounds=(-4.5,4.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface 4x^2 - y^2 - z^2/9 = 1
triple f(pair t) {
	return (0.5/cos(t.x),cos(t.y)*tan(t.x),3*sin(t.y)*tan(t.x));//
}
surface s=surface(f,(-pi/3,0),(pi/3,pi),16,24);
draw(s,emissive(coloronefill),meshpen=colorone);
triple f(pair t) {
	return (-0.5/cos(t.x),cos(t.y)*tan(t.x),3*sin(t.y)*tan(t.x));
}
surface s=surface(f,(-pi/3,0),(pi/3,pi),16,24);
draw(s,emissive(coloronefill),meshpen=colorone);

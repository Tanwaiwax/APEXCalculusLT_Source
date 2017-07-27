include apexconfig;

//ASY file for 10_01_exset_04 solution in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-1,1};
real[] myzchoice={-1,1};

pair xbounds=(-1.5,1.5);
pair ybounds=(-1.5,1.5);
pair zbounds=(-1.25,1.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface x=-y^2-z^2
triple f(pair t) {
	return (-t.x,sqrt(t.x)*cos(t.y),sqrt(t.x)*sin(t.y));
}
surface s=surface(f,(0,0),(1,2*pi),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

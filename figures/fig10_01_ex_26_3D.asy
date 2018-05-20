include apexconfig;

//ASY file for 10_01_exset_04 solution in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(10,5,5);

// setup and draw the axes
real[] myxchoice={-3,3};
real[] myychoice={-1,1};
real[] myzchoice={-5,5};

pair xbounds=(-6,6);
pair ybounds=(-1.5,1.5);
pair zbounds=(-6,6);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
	return (3*cos(t.y)/cos(t.x),tan(t.x),5*sin(t.y)/cos(t.x));
}
surface s=surface(f,(-1,0),(1,2*pi),32,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

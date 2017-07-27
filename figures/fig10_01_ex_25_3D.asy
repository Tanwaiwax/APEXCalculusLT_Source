include apexconfig;

//ASY file for 10_01_exset_04 solution in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(5,5,2);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-sqrt(2),sqrt(2)};
real[] myzchoice={-2,2};

pair xbounds=(-2.5,2.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-2.5,2.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
	return (cos(t.y)*cos(t.x),sqrt(2)*cos(t.y)*sin(t.x),2*sin(t.y));
}
surface s=surface(f,(-pi,-pi/2),(1*pi,pi/2),32,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

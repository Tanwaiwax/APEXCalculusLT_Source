include apexconfig;

//ASY file for 10_01_exset_03 in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(3,12,2);

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={-3,3};
real[] myzchoice={-3,3};

pair xbounds=(-.5,1.5);
pair ybounds=(-3.5,3.5);
pair zbounds=(-3.5,3.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface x^2 + y^2/9 + z^2/4 = 1
triple f(pair t) {
	return (t.y^2,cos(t.x)*t.y,3*sin(t.x)*t.y);
}
surface s=surface(f,(0,0),(2*pi,1),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

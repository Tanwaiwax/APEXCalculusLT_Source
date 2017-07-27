include apexconfig;

//ASY file for 10_01_exset_04 solution in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(5,5,2);

// setup and draw the axes
real[] myxchoice={-.25,.25};
real[] myychoice={-.5,.5};
real[] myzchoice={-.5,.5};

pair xbounds=(-1,1);
pair ybounds=(-1,1);
pair zbounds=(-1,1);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface x^2/9 - y^2 + z^2/25 = 1
triple f(pair t) {
	return (.25/cos(t.x),.25*cos(t.y)*tan(t.x),.25*sin(t.y)*tan(t.x));
}
surface s=surface(f,(-pi/3,0),(pi/3,pi),32,16);
draw(s,emissive(coloronefill),meshpen=colorone);

triple f(pair t) {
	return (-.25/cos(t.x),.25*cos(t.y)*tan(t.x),.25*sin(t.y)*tan(t.x));
}
surface s=surface(f,(-pi/3,0),(pi/3,pi),32,16);
draw(s,emissive(coloronefill),meshpen=colorone);

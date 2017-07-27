include apexconfig;

//ASY file for fig:doublepol2 in Chapter 12 sec:double_int_polar

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(-2.7,-11,16);

// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={-2,2};
real[] myzchoice={5};

pair xbounds=(-0.25,4.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(0,7);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

real r(real t) { return sqrt((2*cos(t)+1)^2+(2*sin(t))^2);}
real ang(real tt) {return atan2(2*sin(tt),(2*cos(tt)+1));}
real ra(pair s) {return 1+s.y*(r(s.x)-1);}

triple g(pair t) {
       return (cos(ang(t.x))*ra(t)+1,
       	      sin(ang(t.x))*ra(t),
	      4-(cos(ang(t.x))*ra(t)+1-2)^2-(sin(ang(t.x))*ra(t))^2);
}

surface s=surface(g,(0,0),(2*pi,1),16,16,
	usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
	vsplinetype=new splinetype[] {notaknot,notaknot,monotonic}
);
draw(s,emissive(coloronefill),meshpen=colorone);


triple g(pair t) { return (cos(ang(t.x))*ra(t)+1,sin(ang(t.x))*ra(t),0);}

surface s=surface(g,(0,0),(2*pi,1),8,8,
	usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
	vsplinetype=new splinetype[] {notaknot,notaknot,monotonic}
);
draw(s,emissive(coloronefill),meshpen=colorone);

triple ff(pair t) {
	return (cos(t.x)+1,sin(t.x),t.y*(4-(cos(t.x)+1-2)^2-(sin(t.x))^2));
}
surface ss= surface(ff,(0,0),(2*pi,1),16,4,Spline);
draw(ss,emissive(coloronefill),meshpen=colorone);

draw(circle((2,0,0),2,Z),colorone+linewidth(2));
draw(circle((1,0,0),1,Z),colorone+linewidth(1));

//draw curve on plane 
triple g(real t) {return (cos(t)+1,sin(t),4-(cos(t)-1)^2-sin(t)^2);}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colorone+linewidth(1));

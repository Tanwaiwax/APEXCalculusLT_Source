include apexconfig;

//ASY file for fig:polcalc8 in Chapter 9 section sec:polarcalc

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,-8,2);

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-0.25,1.25);
pair ybounds=(-.25,.25);
pair zbounds=(-.25,.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice));//,Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
//label("$x$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$y$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

label("\ ",(0,0,1.5));
label("\ ",(0,-1.5,0));

//surface r=cos(2 theta) revolved around x axis
triple f(pair t) {
  return (cos(t.y)*cos(2*t.y),
  	 sin(t.y)*cos(2*t.y)*cos(t.x),
	 sin(t.y)*cos(2*t.y)*sin(t.x));
}
surface s=surface(f,(0,0),(2pi,pi/4),8,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

triple g(real t) {return (cos(t)*cos(2*t),0,sin(t)*cos(2*t));}
path3 mypath=graph(g,0,pi/4,operator ..);
draw(mypath,colorone+linewidth(2));

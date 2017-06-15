include apexconfig;

//ASY file for fig:space5b in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-4.5,4.5);
pair ybounds=(-4.5,4.5);
pair zbounds=(-4.5,4.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface x^2+y^2/9+z^2/4=1
triple f(pair t) {
	return (cos(t.y)*cos(t.x),3*sin(t.y)*cos(t.x),2sin(t.x));
}
surface s=surface(f,(-pi,-pi/2),(pi,pi/2),32,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw the traces for x=0
triple g(real t) {return (0,3*cos(t),2*sin(t));}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colortwo);

//Draw the traces for y=0
triple g(real t) {return (cos(t),0,2*sin(t));}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colortwo);

//Draw the traces for z=0
triple g(real t) {return (cos(t),3*sin(t),0);}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colortwo);

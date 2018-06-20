include apexconfig;

//ASY file for fig:surfrev2 in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,.5);

// setup and draw the axes
real[] myxchoice={-5,5};
real[] myychoice={-5,5};
real[] myzchoice={-1,1};

pair xbounds=(-7,7);
pair ybounds=(-7,7);
pair zbounds=(-1.25,2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the curve z=sin(x)
triple g(real t) {return (t,0,sin(t));}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colorone+.7mm);

//Draw the revolved surface z = sin(sqrt(x^2 + y^2))
triple f(pair t) {
  return (t.y*cos(t.x),
  	 t.y*sin(t.x),
	 sin(sqrt(((t.y*cos(t.x))^2+(t.y*sin(t.x))^2))));
}
surface s=surface(f,(0,0),(2*pi,2*pi),32,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

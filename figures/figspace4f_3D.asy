include apexconfig;

//ASY file for fig:space4b in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(5,5,13);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-2,2);
pair ybounds=(-2,2);
pair zbounds=(-2*pi-.5,2*pi+.75);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the curve x=sin z
triple g(real t) {return (sin(t),0,t);}
path3 mypath=graph(g,-2*pi,2*pi,operator ..);
draw(mypath,colorone);

//Draw the cylinder z=y^2
triple f(pair t) {return (sin(t.y),t.x,t.y);}
surface s=surface(f,(-2,-2*pi),(2,2*pi),16,32,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

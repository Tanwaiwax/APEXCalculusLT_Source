include apexconfig;

//ASY file for fig:shell2 in Chapter 7 section sec:shell_method

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
//currentprojection=orthographic((6.1,13,42.3),(0,1,0),(0,0,0),.95,(.005,-.024));
currentprojection=orthographic((2.6,4.6,47),(0,1,0),(0,0,0),.95,(0.004,0.004));


// setup and draw the axes
real[] myxchoice={1,2,3,4,5,6};
real[] myychoice={1,2,3};
real[] myzchoice={};

pair xbounds=(-.2,6.6);
pair ybounds=(-.2,3.4);
pair zbounds=(-3.4,3.4);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f4(pair t) {return (2.6*cos(t.y)+3,t.x,2.6*sin(t.y));}
surface s4=surface(f4,(1,0),(1.8,2*pi),2,16,Spline);
draw(s4,emissive(colortwofill));

draw(circle((3,1.8,0),2.6,Y),colortwo+.4mm);
draw(circle((3,1,0),2.6,Y),colortwo+.4mm);

draw((0,1,0)--(1,3,0)--(1,1,0)--cycle,colorone+.6mm);

draw((3,0,0)--(3,3.1,0),dashed+.2mm);
draw((.4,1,0)--(.4,1.8,0),colortwo+.4mm);

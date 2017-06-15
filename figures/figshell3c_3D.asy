include apexconfig;

//ASY file for fig:shell3 in Chapter 7 section sec:shell_method

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((3.13,8.3,49),(0,1,0),(0,0,0),.95,(0.0148,0.00673));

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={1,2,3};
real[] myzchoice={};

pair xbounds=(-.2,1.25);
pair ybounds=(-3.4,3.4);
pair zbounds=(-3.4,3.4);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

pen p=colorone;

triple f2(pair t) {return (t.x,(2*t.x+1)*cos(t.y),(2*t.x+1)*sin(t.y));}
surface s2=surface(f2,(0,0),(1,2*pi),2,16,Spline);
draw(s2,emissive(coloronefill));

triple f3(pair t) {return (t.x,cos(t.y),sin(t.y));}
surface s3=surface(f3,(0,0),(1,2*pi),2,16,Spline);
draw(s3,emissive(coloronefill));

triple f3(pair t) {return (1,t.x*cos(t.y),t.x*sin(t.y));}
surface s3=surface(f3,(1,0),(3,2*pi),2,16,Spline);
draw(s3,emissive(coloronefill));

//triple f4(pair t) {return (t.x,1.8*cos(t.y),1.8*sin(t.y));}
//surface s4=surface(f4,(.4,0),(1,2*pi),2,16,Spline);
//draw(s4,rgb(1,.6,.6)+opacity(.7));

//triple g3(real t) {return (.4,1.8*cos(t),1.8*sin(t));}
//path3 p3=graph(g3,0,2*pi,operator ..);
//draw(p3,red+.4mm);

draw((0,1,0)--(1,3,0)--(1,1,0)--cycle,colorone+.6mm);

draw((.4,1.8,0)--(1,1.8,0),colortwo+.4mm);

//triple g3(real t) {return (0,cos(t),sin(t));}
//path3 p3=graph(g3,0,2*pi,operator ..);
draw(circle(O,1,X),colorone+.4mm);

//triple g3(real t) {return (1,cos(t),sin(t));}
//path3 p3=graph(g3,0,2*pi,operator ..);
draw(circle((1,0,0),1,X),colorone+.4mm);

//triple g3(real t) {return (1,3*cos(t),3*sin(t));}
//path3 p3=graph(g3,0,2*pi,operator ..);
draw(circle((1,0,0),3,X),colorone+.4mm);

//triple g3(real t) {return (2,3*cos(t),3*sin(t));}
//path3 p3=graph(g3,0,2*pi,operator ..);
//draw(p3,blue+.4mm);

//draw((2,2,0)--(2,3,0),purple+linetype(new real[] {4,4})+.3mm);

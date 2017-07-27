include apexconfig;

//ASY file for 13_06_exset_02 in Chapter 13 sec:triple_int

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={1};
real[] myzchoice={1};

pair xbounds=(-0.25,1.5);
pair ybounds=(-0.25,1.5);
pair zbounds=(-0.25,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//parabola in plane
triple g(real t) {return (t,1-t^2,0);}
path3 mypath=graph(g,0,1,operator ..);
draw(mypath,colorone+linewidth(2));
triple g(real t) {return (0,1-t^2,t);}
path3 mypath=graph(g,0,1,operator ..);
draw(mypath,colorone+linewidth(2));
triple g(real t) {return (t,1-t^2,t);}
path3 mypath=graph(g,0,1,operator ..);
draw(mypath,colorone+linewidth(2));

//draw square and sideline
draw((0,0,0)--(1,0,0)--(1,0,1)--(0,0,1)--(0,0,0),colorone+linewidth(2));
draw((0,0,0)--(0,1,0),colorone+linewidth(2));

triple top(pair t) { return (t.x*t.y,1-t.y^2,t.y);} // sure wish I could use t.z
surface topsurf = surface(top,(0,0),(1,1));
draw(topsurf,emissive(colortwofill),colortwo);

triple side(pair t) { return (t.x,1-t.x^2,t.y*t.x);}
surface sidesurf = surface(side,(0,0),(1,1));
draw(sidesurf,emissive(coloronefill),colorone);

//label and arrow
label("$y=1-x^2$",(1,1,0));
draw((0.9,0.9,.1)--(.65,.6,.4),Arrow3(size=2mm));
label("$y=1-z^2$",(0,1,.85));
draw((.1,.9,.75)--(.3,.8,.45),Arrow3(size=2mm));

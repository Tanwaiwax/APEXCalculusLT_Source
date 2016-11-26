include apexconfig;

// ASY file for fig:shell4 in 07_Shell_Method

currentprojection=orthographic((18,7.7,21.1),(0,1,0),(0,0,0),1,(-0.088,.0039));
size(200,200,IgnoreAspect);

// setup and draw the axes
real[] myxchoice={1,2,3};
real[] myychoice={1,2,3};
real[] myzchoice={};

pair xbounds=(-2.2,3.2);
pair ybounds=(-.1,3.2);
pair zbounds=(-3,3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


triple g1(real t) {return (t,t*(3-t),0);}
path3 parab=graph(g1,0,3,operator ..);
draw(parab,colorone+.4mm);

path3 linebdy=(0,0,0)--(xbounds.y,xbounds.y,0);
draw(linebdy,colorone+.4mm);

triple cylfunc(pair t) {return (cos(t.x),t.y,sin(t.x));}
surface cyl=surface(cylfunc,(0,1),(2*pi,2),16);
draw(cyl,emissive(colortwofill));

draw(circle((0,1,0),1,Y),black+.4mm);
draw(circle((0,2,0),1,Y),black+.4mm);

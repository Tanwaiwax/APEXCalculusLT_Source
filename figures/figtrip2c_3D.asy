include apexconfig;

//ASY file for fig:trip2b in Chapter 13 sec:triple_int

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(7.2,10.1,6.5);

// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={5};
real[] myzchoice={2};

pair xbounds=(-0.5,5);
pair ybounds=(-0.5,7);
pair zbounds=(-0.5,3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

path3 p = (0,0,2)--(0,6,0)--(0,0,0)--cycle;

//triangle in space
draw(p,colorone+linewidth(1.5));
//shade
draw(surface(p), emissive(coloronefill));
label("$z=2-y/3$",(2,3,0));

// make the perspective match figtrip2d
draw((3,0,0)--O,invisible);

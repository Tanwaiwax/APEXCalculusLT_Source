include apexconfig;

//ASY file for fig:trip1 in Chapter 13 sec:triple_int

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(5.4,-12.7,20.2);

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={2,4};
real[] myzchoice={-5,5};

pair xbounds=(-0.5,3);
pair ybounds=(-0.5,5);
pair zbounds=(-5.25,10);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//lines of the triangles
draw((0,4,0)--(2,0,2)--(0,0,8)--cycle,colortwo+linewidth(1.5));
draw((0,0,-4)--(0,0,8)--(2,0,2)--cycle,black+linewidth(1.5));
draw((0,0,-4)--(0,4,0),colorone+linewidth(1.5));

//shade
path3 p = (0,4,0)--(2,0,2)--(0,0,8)--cycle;
draw(surface(p), emissive(colortwofill));

path3 p = (0,0,-4)--(0,4,0)--(2,0,2)--cycle;
draw(surface(p), emissive(coloronefill));

path3 p = (0,0,-4)--(0,0,8)--(2,0,2)--cycle;
draw(surface(p), rgb(.7,.7,.7)+opacity(.2)); // rgb ok

path3 p = (0,0,-4)--(0,0,8)--(0,4,0)--cycle;
draw(surface(p), rgb(.7,.7,.7)+opacity(.2)); // rgb ok

// to get same perspective as figtrip1a, draw with invisible pen
draw((2,0,2)--(2,4,6),invisible);
draw((2,0,2)--(2,4,-6),invisible);

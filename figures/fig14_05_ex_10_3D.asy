include apexconfig;

//ASY file for Exercise 14.5#10

size(200,200,IgnoreAspect);
currentprojection=orthographic(7.2,-5.1,8);

// setup and draw the axes
real[] myxchoice={1,2};
real[] myychoice={1,2};
real[] myzchoice={2,4};

pair xbounds=(-0.25,2.5);
pair ybounds=(-0.25,2.5);
pair zbounds=(-0.25,5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//edges of object
draw((0,1,0)--(2,1,0)--(2,0,0)--cycle,colorone+linewidth(2));
draw((0,1,0)--(2,1,4)--(2,1,0)--cycle,colorone+linewidth(2));
draw((0,1,0)--(2,1,4)--(2,0,0)--cycle,colorone+linewidth(2));

//shade plane
path3 p=(0,1,0)--(2,1,4)--(2,0,0);
draw(surface(p -- cycle), emissive(coloronefill));

path3 p=(2,0,0)--(2,1,4)--(2,1,0);
draw(surface(p -- cycle), emissive(coloronefill));

path3 p=(0,1,0)--(2,1,4)--(2,1,0);
draw(surface(p -- cycle), emissive(coloronefill));

path3 p=(0,1,0)--(2,1,0)--(2,0,0);
draw(surface(p -- cycle), emissive(coloronefill));

//label and arrow
label("$z=2x+4y-4$",(1,0.5,4));
draw((1,0.5,3.6)--(1.2,.65,1.6),Arrow3(size=2mm));

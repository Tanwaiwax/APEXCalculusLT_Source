include apexconfig;

//ASY file for 13_06_exset_02 in Chapter 13 sec:triple_int

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(8.8,7.8,3);

// setup and draw the axes
real[] myxchoice={1,2,3};
real[] myychoice={1,2,3};
real[] myzchoice={1};

pair xbounds=(-0.5,3.5);
pair ybounds=(-0.5,3.5);
pair zbounds=(-0.5,1.75);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//edges of object
draw((1,0,0)--(1,2,0)--(3,2,0)--(3,0,0)--cycle,colorone+linewidth(2));
draw((3,0,0)--(1,0,1)--(1,2,1)--(3,2,0),colorone+linewidth(2));
draw((3,0,0)--(1,0,1),colorone+linewidth(2));
draw((1,0,0)--(1,0,1),colorone+linewidth(2));
draw((1,2,0)--(1,2,1),colorone+linewidth(2));

//shade faces
draw(surface((1,0,0)--(1,2,0)--(3,2,0)--(3,0,0)--cycle),emissive(coloronefill));
draw(surface((1,0,1)--(1,2,1)--(3,2,0)--(3,0,0)--cycle),emissive(coloronefill));
draw(surface((1,0,0)--(1,2,0)--(1,2,1)--(1,0,1)--cycle),emissive(coloronefill));
draw(surface((1,0,0)--(3,0,0)--(1,0,1)--cycle),emissive(coloronefill));
draw(surface((1,2,0)--(3,2,0)--(1,2,1)--cycle),emissive(coloronefill));

//labels and arrow
label("$z=\frac{1}{2}(3-x)$",(3,0,1.1));
draw((3,0.25,1)--(2,1,0.45),Arrow3(size=2mm));

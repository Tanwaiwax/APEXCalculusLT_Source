include apexconfig;

//ASY file for fig:trip4 in Chapter 13 sec:triple_int

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(11.2,8.3,2.7);

// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={2,4};
real[] myzchoice={1};

pair xbounds=(-0.1,4.25);
pair ybounds=(-0.1,4.25);
pair zbounds=(-0.1,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//lines for pyramid
draw((0,0,0)--(2,0,0)--(2,4,0)--(0,4,0)--cycle,colorone+linewidth(2));
draw((0,0,0)--(0,0,1),colorone+linewidth(2));
draw((2,0,0)--(0,0,1),colorone+linewidth(2));
draw((0,4,0)--(0,0,1),colorone+linewidth(2));
draw((2,4,0)--(0,0,1),colorone+linewidth(2));

//shade rectangle and sides
path3 p = (0,0,0)--(2,0,0)--(2,4,0)--(0,4,0); 
draw(surface(p -- cycle), emissive(coloronefill));
path3 p = (0,0,0)--(2,0,0)--(0,0,1);
draw(surface(p -- cycle), emissive(coloronefill));
path3 p = (0,0,0)--(0,4,0)--(0,0,1);
draw(surface(p -- cycle), emissive(coloronefill));
path3 p = (0,4,0)--(2,4,0)--(0,0,1); 
draw(surface(p -- cycle), emissive(coloronefill));
path3 p = (2,0,0)--(2,4,0)--(0,0,1); 
draw(surface(p -- cycle), emissive(coloronefill));

//labels and arrows
label("$z=1-\frac{1}{2}x$",(3.5,1.65,0));
draw((3,1.5,0)--(1.8,2,.1),Arrow3(size=2mm));
label("$z=1-\frac{1}{4}y$",(0,3,1));
draw((0,3,0.8)--(1,3,0.25),Arrow3(size=2mm));

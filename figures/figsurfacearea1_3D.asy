include apexconfig;

//ASY file for fig:surfacearea1 in Chapter 13 sec:surface_area

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(10.5,6.1,12);

// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={2,4};
real[] myzchoice={2,4};

pair xbounds=(-0.25,4.5);
pair ybounds=(-0.25,4.25);
pair zbounds=(0,5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

////triple f(pair t) {
////  return (t.x,t.y,4-t.x-2*t.y);
////}
////surface s=surface(f,(-0.25,-0.25),(4,2),4,4);
////draw(s,emissive(coloronefill),meshpen=colorone);

//draw the triangle on plane
////draw((4,0,0)--(0,2,0)--(0,0,4)--(4,0,0),colorone);
draw(surface((4,0,0)--(0,2,0)--(0,0,4)--cycle),emissive(coloronefill),colorone);
// using longer draw instead of ////

//draw the triangle on xy plane
draw((4,0,0)--(0,2,0)--(0,0,0)--(4,0,0),colorone+dashed+linewidth(2));

//draw red line on plane
//draw((0.8,1.6,0)--(0,0,4),colortwo+linewidth(1));
// what is the red line for?

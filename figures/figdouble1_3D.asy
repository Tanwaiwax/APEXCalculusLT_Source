include apexconfig;

//ASY file for fig:double1 in Chapter 13 sec:double_int_volume

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(10,-8,25);

// setup and draw the axes
real[] myxchoice={1,2,3,4};
real[] myychoice={1,2};
real[] myzchoice={10};

pair xbounds=(0,5);
pair ybounds=(0,2.5);
pair zbounds=(0,15);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface//{z=xy+e^y};
triple f(pair t) {
  return (t.x,t.y,t.x*t.y+exp(t.y));
}
surface s=surface(f,(0,0),(4.25,2.25),12,20,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw rectangle in plane
draw((3,1,0)--(4,1,0)--(4,2,0)--(3,2,0)--(3,1,0),colorone+linewidth(2));
label("$R$",(3.5,1.5,0));

//Draw rectangle on surface
draw((3,1,3+exp(1))--(4,1,4+exp(1))..(4,1.5,6+exp(1.5))..(4,2,8+exp(2))--(3,2,6+exp(2))..(3,1.5,4.5+exp(1.5))..(3,1,3+exp(1)),colorone+linewidth(2));

//Draw vertical lines
draw((3,1,0)--(3,1,3+exp(1)),colorone+dashed+linewidth(0.75));
draw((3,2,0)--(3,2,6+exp(2)),colorone+dashed+linewidth(0.75));
draw((4,1,0)--(4,1,4+exp(1)),colorone+dashed+linewidth(0.75));
draw((4,2,0)--(4,2,8+exp(2)),colorone+dashed+linewidth(0.75));

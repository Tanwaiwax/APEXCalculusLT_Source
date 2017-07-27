include apexconfig;

//ASY file for 13_06_exset_02 in Chapter 13 sec:triple_int

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(14,10,21);

// setup and draw the axes
real[] myxchoice={3};
real[] myychoice={3,6,9};
real[] myzchoice={3,6,9};

pair xbounds=(-0.25,5);
pair ybounds=(-0.25,10);
pair zbounds=(-0.25,10);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//edges of object
draw((0,0,0)--(0,9,0)--(3,9,0)--cycle,colorone+linewidth(2));
draw((0,9,0)--(0,9,9)--(0,0,0)--cycle,colorone+linewidth(2));
triple g(real t) {return (t,9,sqrt(81-9*t^2));}
path3 mypath=graph(g,0,3,operator ..);
draw(mypath,colorone+linewidth(2));

triple f(pair t) {
  return (t.x/3*t.y,t.x,sqrt(t.x^2-9(t.x/3*t.y)^2));
}
surface s=surface(f,(0,0),(9,1),8,12,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//label and arrow
label("$z=\sqrt{y^2-9x^2}$",(4,4.5,0));
draw((3.3,4,.2)--(1.25,4,1.4),Arrow3(size=2mm));

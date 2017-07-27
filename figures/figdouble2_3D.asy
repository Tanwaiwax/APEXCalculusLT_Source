include apexconfig;

//ASY file for fig:double2 in Chapter 13 sec:double_int_volume

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(1.6,-5.5,12.4);

// setup and draw the axes
real[] myxchoice={1,2,3,4};
real[] myychoice={1};
real[] myzchoice={2,4,6,8};

pair xbounds=(0,2.5);
pair ybounds=(0,1.5);
pair zbounds=(0,9);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,3*t.x*t.y-t.x^2-t.y^2+6);
}
surface s=surface(f,(-0.1,-0.1),(2.1,1.1),12,20,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw triangle in plane
draw((0,0,0)--(2,0,0)--(0,1,0)--(0,0,0),colorone+linewidth(2));
label("$R$",(0,0.5,0),E);

//Draw triangle on surface
triple g(real t) {return (t,0,6-t^2);}
path3 mypath=graph(g,0,2,operator ..);
draw(mypath,colorone+linewidth(2));

triple g(real t) {return (0,t,6-t^2);}
path3 mypath=graph(g,0,1,operator ..);
draw(mypath,colorone+linewidth(2));

triple g(real t) {return (2-2*t,t,3*(2-2*t)*(t)-(2-2*t)^2-(t)^2+6);}
path3 mypath=graph(g,0,1,operator ..);
draw(mypath,colorone+linewidth(2));

//Draw vertical lines
draw((2,0,0)--(2,0,2),colorone+dashed+linewidth(0.75));
draw((0,1,0)--(0,1,5),colorone+dashed+linewidth(0.75));

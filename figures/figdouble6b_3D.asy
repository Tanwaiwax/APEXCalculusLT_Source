include apexconfig;

//ASY file for fig:double6b in Chapter 13 sec:double_int_volume

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(6.3,9.6,2.4);

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={2};
real[] myzchoice={1};

pair xbounds=(0,4);
pair ybounds=(0,3);
pair zbounds=(0,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,exp(-t.x^2));
}
surface s=surface(f,(-0.25,0),(3.5,3.5),12,20,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw lines in plane
draw((0,0,0)--(3,0,0)--(3,3,0)--cycle,colorone+dashed+linewidth(0.75));

//Draw lines on surface
draw((3,0,0)--(3,3,0),colorone+linewidth(2));
triple g(real t) {return (t,0,exp(-t^2));}
path3 mypath=graph(g,0,3,operator ..);
draw(mypath,colorone+linewidth(2));
triple g(real t) {return (t,t,exp(-t^2));}
path3 mypath=graph(g,0,3,operator ..);
draw(mypath,colorone+linewidth(2));

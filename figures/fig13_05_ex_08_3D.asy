include apexconfig;

//ASY file for 13_05_exset_01 in Chapter 13 sec:surface_area

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(7.6,3.9,3.5);

// setup and draw the axes
real[] myxchoice={-5,5};
real[] myychoice={-1,1};
real[] myzchoice={1};

pair xbounds=(-6,6);
pair ybounds=(-1,1.5);
pair zbounds=(-0.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,1/(exp(t.x^2)+1));
}
surface s=surface(f,(-6,-0.5),(6,1.5),16,12,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//lines on surface
draw((5,0,0)--(5,1,0),colorone+dashed+linewidth(1.5));
draw((-5,0,0)--(-5,1,0),colorone+dashed+linewidth(1.5));
triple g(real t) {return (t,0,1/(exp(t^2)+1));}
path3 mypath=graph(g,-5,5,operator ..);
draw(mypath,colorone+dashed+linewidth(1.5));
triple g(real t) {return (t,1,1/(exp(t^2)+1));}
path3 mypath=graph(g,-5,5,operator ..);
draw(mypath,colorone+dashed+linewidth(1.5));

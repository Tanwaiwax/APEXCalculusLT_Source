include apexconfig;

//ASY file for fig:double4 in Chapter 13 sec:double_int_volume
// and fig:double8

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(16,6.2,5.6);

// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={2,4};
real[] myzchoice={2,4};

pair xbounds=(0,5);
pair ybounds=(0,5);
pair zbounds=(0,5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,4-t.y);
}
surface s=surface(f,(-0.25,-0.25),(4.5,4.25),12,20,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw parabolas in plane
triple g(real t) {return (t^2/4,t,0);}
path3 mypath=graph(g,0,4.25,operator ..);
draw(mypath,colorone+linewidth(2));
triple g(real t) {return (t,t^2/4,0);}
path3 mypath=graph(g,0,4.25,operator ..);
draw(mypath,colorone+linewidth(2));

//Draw parabolas on surface
triple g(real t) {return (t^2/4,t,4-t);}
path3 mypath=graph(g,0,4.,operator ..);
draw(mypath,colorone+linewidth(2));
triple g(real t) {return (t,t^2/4,4-t^2/4);}
path3 mypath=graph(g,0,4.,operator ..);
draw(mypath,colorone+linewidth(2));

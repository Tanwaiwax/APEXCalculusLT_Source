include apexconfig;

//ASY file for fig:trip2bb in Chapter 13 sec:triple_int

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(6.7,1.9,11.5);

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={1,2};
real[] myzchoice={2,4};

pair xbounds=(-0.5,2.5);
pair ybounds=(-0.5,2.25);
pair zbounds=(-0.5,4.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,2*t.y);
}
surface s=surface(f,(0,0),(2,1.5),1,1,Spline);
draw(s,invisible);

triple f(pair t) {
  return (t.x,t.y,3-t.x^2-t.y^2);
}
surface s=surface(f,(0,0),(2,1.5),8,8,Spline);
draw(s,invisible);

//lines and curves on the surfaces
draw((0,0,0)--(0,1,2),colorone+dashed+linewidth(1));
triple g(real t) {return (t,0,2*(1-(t/2)^2));}
path3 mypath=graph(g,0,2,operator ..);
draw(mypath,colorone+dashed+linewidth(1));
triple g(real t) {return (t,1-(t/2)^2,0);}
path3 mypath=graph(g,0,2,operator ..);
draw(mypath,colorone+dashed+linewidth(1));

triple g(real t) {return (t,1-(t/2)^2,2*(1-(t/2)^2));}
path3 mypath=graph(g,0,2,operator ..);
draw(mypath,colorone+linewidth(2));

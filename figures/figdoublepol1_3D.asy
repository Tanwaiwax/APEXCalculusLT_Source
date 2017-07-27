include apexconfig;

//ASY file for fig:doublepol1 in Chapter 12 sec:double_int_polar

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(7.2,-1.9,13);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-1,1};
real[] myzchoice={5};

pair xbounds=(-1.5,1.5);
pair ybounds=(-1.5,1.5);
pair zbounds=(0,10);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,4-t.x-2*t.y);
}
surface s=surface(f,(-1.5,-1.5),(1.5,1.5),8,8,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//draw curve on xy plane
draw(circle(O,1,Z),colorone+linewidth(2));

//draw curve on plane 
triple g(real t) {return (cos(t),sin(t),4-cos(t)-2*sin(t));}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colorone+linewidth(2));

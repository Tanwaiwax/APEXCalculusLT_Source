include apexconfig;

//ASY file for figparcalc8 in Section sec:par_calc

size(200,200,IgnoreAspect);
currentprojection=orthographic(4,3,2);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-1.5,1.5);
pair ybounds=(-1.,1.);
pair zbounds=(-1.25,1.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

//label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$x$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$y$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//surface t(t^2-1), t^2-1 revolved around x axis
//({(x^2-1)*cos(y)},{x^3-x},{(x^2-1)*sin(y)});
triple f(pair t) {
  return ((t.x^2-1)*cos(t.y),(t.x^3-t.x),(t.x^2-1)*sin(t.y));
}
surface s=surface(f,(-1,0),(1,2*pi),8,8,Spline);
//pen p=rgb(0,0,.7);
draw(s,emissive(coloronefill),meshpen=colorone);

//curve on the surfaces
triple g(real t) {return (0,t^3-t,-1+t^2);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,black+linewidth(2));

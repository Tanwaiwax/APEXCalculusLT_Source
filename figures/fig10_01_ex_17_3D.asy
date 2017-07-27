include apexconfig;

//ASY file for 10_01_exset_02 solution in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-3,3};
real[] myzchoice={};

pair xbounds=(-4,4);
pair ybounds=(-4,4);
pair zbounds=(-4,4);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the cylinder on top
triple f(pair t) {
  return (2*cos(t.x),3*sin(t.x),t.y);
}
surface s=surface(f,(0,-2),(2*pi,2),32,8,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw the traces (in this case vertical lines)
for ( int n = 0 ; n < 10 ; ++n ) {
  real theta = n*2*pi/10;
  triple g(real t) {return (2*cos(theta),3*sin(theta),t);}
  path3 mypath=graph(g,-2,2,operator ..);
  draw(mypath,colortwo);
}

triple g(real t) {return (2*cos(t),3*sin(t),0);}
path3 mypath=graph(g,0,2*pi,operator ..); draw(mypath,blue);

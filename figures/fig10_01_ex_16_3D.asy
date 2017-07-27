include apexconfig;

//ASY file for 10_01_exset_02 solution in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={-3,3};
real[] myzchoice={-6,6};

pair xbounds=(-2,2);
pair ybounds=(-2,2);
pair zbounds=(-2*pi,2*pi);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the cylinder on top
triple f(pair t) {
  return (t.x,cos(t.y),t.y);
}
surface s=surface(f,(-2,-2*pi),(2,2*pi),8,32,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw the traces
triple g(real t) {return (t,cos(0),0);}
path3 mypath=graph(g,-2,2,operator ..);
draw(mypath,colortwo);
for ( int n = 0 ; n < 4 ; ++n ) {
  real z = (2*n-3)*pi/2;
  triple g(real t) {return (t,cos(z),z);}
  path3 mypath=graph(g,-2,2,operator ..);
  draw(mypath,colortwo);
}

triple g(real t) {return (0,cos(t),t);}
path3 mypath=graph(g,-2*pi,pi*2,operator ..);
draw(mypath,colorone);

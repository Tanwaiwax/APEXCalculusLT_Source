include apexconfig;

//ASY file for 10_01_exset_02 solution in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-1.25,1.25);
pair ybounds=(-1.25,1.25);
pair zbounds=(-1.25,1.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the parabola z=x^3 for t from -2 to 2
triple g(real t) {return (t,0,t^3);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colorone);

//Draw the cylinder z=x^3
triple f(pair t) {
  return (t.x,t.y,(t.x)^3);
}
surface s=surface(f,(-1,-1),(1,1),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw the traces (in this case lines)
for ( int n = 0 ; n < 11 ; ++n ) {
  real x = (n-5)/5;
  triple g(real t) {return (x,t,x^3);}
  path3 mypath=graph(g,-1,1,operator ..);
  draw(mypath,colortwo);
}

triple g(real t) {return (t,0,(t)^3);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colorone);

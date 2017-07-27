include apexconfig;

//ASY file for fig:levelcurves1 in Chapter 12 sec:multi_intro

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(9,9,2);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={1};

pair xbounds=(-3.5,3.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-0.25,1.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw top half of surface x^2/9+y^2/4+z^2=1
triple f(pair t) {
  return (3*sin(t.y),sin(t.x)*2*cos(t.y),cos(t.x)*cos(t.y));
}
surface s=surface(f,(-pi/2,-pi/2),(pi/2,pi/2),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw level curves for surface x^2/9+y^2/4+z^2=1 at c=0,0.2,0.4,0.6,0.8
for ( int n = 0 ; n < 5 ; ++n ) {
  real c = n/5;
  triple g(real t) {return (3*cos(t)*sqrt(1-c^2),2*sin(t)*sqrt(1-c^2),c);}
  path3 mypath=graph(g,0,2*pi,operator ..);
  draw(mypath,colorone);
}

dotfactor=3;
dot((0,0,1),colorone); // the "level curve" at 1

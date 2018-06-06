include apexconfig;

//ASY file for 14.6 exset 2

size(200,200,IgnoreAspect);
currentprojection=orthographic(19,17,1);

// setup and draw the axes
real[] myxchoice={-5,5};
real[] myychoice={-3,3};
real[] myzchoice={1};
pair xbounds=(-5.75,5.75);
pair ybounds=(-5.75,5.75);
pair zbounds=(-0.25,1.1);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the parabola z=y^2 for t from -2 to 2
triple g(real t) {return (5cos(t),3sin(t),0);}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,colorone);

//Draw the cylinder z=y^2
triple f(pair t) {
  return (5t.y*cos(t.x),3t.y*sin(t.x),0);
}
surface s=surface(f,(0,0),(2pi,1),8,8,Spline);
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

//Draw the cylinder z=y^2
triple f(pair t) {
  return (5t.y*cos(t.x),3t.y*sin(t.x),1-t.y^2);
}
surface s=surface(f,(0,0),(2pi,1),8,8,Spline);
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

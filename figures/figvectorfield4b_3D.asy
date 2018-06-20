include apexconfig;
 
// ASY file for fig:vectorfield4 in Section 14.2

size(200,200,IgnoreAspect);
currentprojection=orthographic(10.5,-9,18.3);

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={1};
real[] myzchoice={3};
pair xbounds=(-1.1,1.1);
pair ybounds=(-1.1,1.1);
pair zbounds=(-1,4);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

real f(pair z) {return -z.x^2-2*z.y^2+3;}

path3 gradient(pair z) {
  static real dx=sqrtEpsilon, dy=dx;
  return (0,0,0)--((f(z+dx)-f(z-dx))/2dx,(f(z+I*dy)-f(z-I*dy))/2dy,0);
}

pair a=(-.9,-.9);
pair b=(.9,.9);

triple F(pair z) {return (z.x,z.y,0);}

add(vectorfield(gradient,F,a,b,12,12,colorone));

pen p=colorone;
draw(surface(f,a,b,Spline),emissive(coloronefill),meshpen=p);

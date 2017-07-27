include apexconfig;

//ASY file for fig:multi_extreme2 in Chapter 12 sec:multi_extreme_values

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={2};

pair xbounds=(-3,3);
pair ybounds=(-3,3);
pair zbounds=(-1,3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=2-sqrt(x^2+y^2)
triple f(pair t) {
  return (t.x,t.y,2-sqrt(t.x^2+t.y^2));
}
surface s=surface(f,(-2,-2),(2,2),32,32);
draw(s,emissive(coloronefill),meshpen=colorone);

//plot point on surface
dotfactor=4;
dot((0,0,2));

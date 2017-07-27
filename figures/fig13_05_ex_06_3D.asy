include apexconfig;

//ASY file for 13_05_exset_01 in Chapter 13 sec:surface_area

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(13,13,1.8);

// setup and draw the axes
real[] myxchoice={-4,-2,2,4};
real[] myychoice={-4,-2,2,4};
real[] myzchoice={1};

pair xbounds=(-4.25,4.25);
pair ybounds=(-4.25,4.25);
pair zbounds=(-0.25,1.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,1/(1+t.x^2+t.y^2));
}
surface s=surface(f,(-4,-4),(4,4),12,12,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

draw(circle((0,0,1/10),3,Z),colorone+dashed+linewidth(1));

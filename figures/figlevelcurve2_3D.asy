include apexconfig;

//ASY file for fig:levelcurves2 in Chapter 12 sec:multi_intro

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(6,-12,.4);

// setup and draw the axes
real[] myxchoice={-5,5};
real[] myychoice={-5,5};
real[] myzchoice={-0.7,0.7};

pair xbounds=(-6,6);
pair ybounds=(-6,6);
pair zbounds=(-0.8,.8);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=(x+y)/(1+x^2+y^2)
triple f(pair t) {
  return (t.x,t.y,(t.x+t.y)/(1+(t.x)^2+(t.y)^2));
}
surface s=surface(f,(-6,-6),(6,6),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw level curves for surface x^2/9+y^2/4+z^2=1 at c=pm0.2,pm0.4,pm0.6
for (int i=1; i<=3; ++i) {
  real c = i/5;
  draw(circle((1/(2*c),1/(2*c),c),sqrt((1/(2*c^2))-1),Z),colorone);
  draw(circle((1/(-2*c),1/(-2*c),-c),sqrt((1/(2*c^2))-1),Z),colorone);
}

draw((-6,6,0)--(6,-6,0),colorone); // the level curve for c=0

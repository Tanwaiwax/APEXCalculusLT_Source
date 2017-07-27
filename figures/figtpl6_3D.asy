include apexconfig;

//ASY file for fig:tpl6 in Chapter 12 sec:multi_tangent

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(13,10,9);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={-2,2};

pair xbounds=(-3,3);
pair ybounds=(-3,3);
pair zbounds=(-3,3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (cos(t.x)*t.y,sin(t.x)*t.y,2-t.y^2);
}
surface s=surface(f,(0,0),(2*pi,2),8,8,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);


//plot point on surface
dotfactor=3;
dot((0,1,1));

triple g(pair t) {return (t.x,t.y,-2*t.y+3);}
surface ss=surface(g,(-1,.5),(1,1.5),1,1);
draw(ss,emissive(colortwofill),meshpen=colortwo);

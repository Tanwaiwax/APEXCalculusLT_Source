include apexconfig;

//ASY file for fig:double_summary in Chapter 13 sec:double_int_volume

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(8.2,4.6,1.5);

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={-1,1};
real[] myzchoice={1};

pair xbounds=(-1,2.5);
pair ybounds=(-1.25,1.25);
pair zbounds=(-.05,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple g(real t) {return (cos(t)*(1+cos(2*t)),sin(t)*(1+cos(2*t)),0);}
path3 mypath=graph(g,-pi/2,pi/2,operator ..);
draw(mypath,colorone);

// draw curve on surface
triple g(real t) {
  return (cos(t)*(1+cos(2*t)),sin(t)*(1+cos(2*t)),1);
}
path3 mypath=graph(g,-pi/2,pi/2,operator ..); 
draw(mypath,colorone);

triple gg(pair t) {
       return (cos(t.x)*(1+cos(2*t.x)),sin(t.x)*(1+cos(2*t.x)),t.y);
}
surface s=surface(gg,(-pi/2,0),(pi/2,1),16,4,Spline);
draw(s,emissive(colortwofill),meshpen=colortwo);

triple f(pair t) {
  return (t.x,t.y,1);
}
surface s=surface(f,(-.1,ybounds.x),(xbounds.y,ybounds.y),8,8);
draw(s,emissive(coloronefill),meshpen=colorone);

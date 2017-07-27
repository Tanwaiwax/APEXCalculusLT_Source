include apexconfig;

//ASY file for fig:double_intro in Chapter 13 sec:double_int_volume

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(7.5,3.1,3);

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={-1,1};
real[] myzchoice={2};

pair xbounds=(-1,2.5);
pair ybounds=(-1.25,1.25);
pair zbounds=(0,2.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,-.5*(t.x-1)^2-.5*(t.y)^2+2);
}
surface s=surface(f,(-0.221,-1),(2.2,1),12,20,
	vsplinetype=new splinetype[] {notaknot,notaknot,monotonic},
	usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=colorone);

pen pp=linewidth(.25mm);
//draw the grid in the xy-plane
//along fixed x
draw((0,-.3,0) -- (0,.3,0),pp);
draw((.2,-.4,0) -- (.2,.4,0),pp);
draw((0.4,-.6,0) -- (.4,.6,0),pp);
draw((0.6,-.7,0) -- (.6,.7,0),pp);
draw((.8,-.8,0) -- (.8,.8,0),pp);
draw((1,-.8,0) -- (1,.8,0),pp);
draw((1.2,-.8,0) -- (1.2,.8,0),pp);
draw((1.4,-.8,0) -- (1.4,.8,0),pp);
draw((1.6,-.7,0) -- (1.6,.7,0),pp);
draw((1.8,-.6,0) -- (1.8,.6,0),pp);
draw((2,-.4,0) -- (2,.4,0),pp);
//along fixed y
draw((.8,.8,0) -- (1.4,.8,0),pp);
draw((.6,.7,0) -- (1.6,.7,0),pp);
draw((.4,.6,0) -- (1.8,.6,0),pp);
draw((.4,.5,0) -- (1.8,.5,0),pp);
draw((.2,.4,0) -- (2,.4,0),pp);
draw((0,.3,0) -- (2,.3,0),pp);
draw((0,.2,0) -- (2,.2,0),pp);
draw((0,.1,0) -- (2,.1,0),pp);
draw((.8,-.8,0) -- (1.4,-.8,0),pp);
draw((.6,-.7,0) -- (1.6,-.7,0),pp);
draw((.4,-.6,0) -- (1.8,-.6,0),pp);
draw((.4,-.5,0) -- (1.8,-.5,0),pp);
draw((.2,-.4,0) -- (2,-.4,0),pp);
draw((0,-.3,0) -- (2,-.3,0),pp);
draw((0,-.2,0) -- (2,-.2,0),pp);
draw((0,-.1,0) -- (2,-.1,0),pp);

triple g(real t) {return (cos(t)*(1+cos(2*t)),sin(t)*(1+cos(2*t)),0);}
path3 mypath=graph(g,-pi/2,pi/2,operator ..);
draw(mypath,colorone);

// draw curve on surface
triple g(real t) {
  return (cos(t)*(1+cos(2*t)),
  	  sin(t)*(1+cos(2*t)),
	  -.5*(cos(t)*(1+cos(2*t))-1)^2-.5*(sin(t)*(1+cos(2*t)))^2+2);
}
path3 mypath=graph(g,-pi/2,pi/2,operator ..); 
draw(mypath,colorone);

draw((1.6,.3,1.775)--(1.6,.4,1.74)--(1.8,.4,1.6)--(1.8,.3,1.635)--cycle,colorone+.4mm);

//Draw the rectangular column
//base
draw((1.6,0.3,0)--(1.8,.3,0)--(1.8,.4,0)--(1.6,.4,0)--cycle,colortwo+.4mm);

//  //verticals plotted to average of 4 function heights
//top
draw((1.6,0.3,1.7)--(1.8,.3,1.7)--(1.8,.4,1.7)--(1.6,.4,1.7)--cycle,colortwo);

path3 p = (1.6,0.3,0)--(1.8,.3,0) -- (1.8,0.3,1.7)--(1.6,.3,1.7); //Left
draw(surface(p -- cycle),emissive(colortwofill),meshpen=colortwo);
path3 p = (1.6,0.3,1.7)--(1.8,.3,1.7)--(1.8,.4,1.7)--(1.6,.4,1.7); //top
draw(surface(p -- cycle),emissive(colortwofill),meshpen=colortwo);
path3 p = (1.6,0.4,0)--(1.8,.4,0) -- (1.8,0.4,1.7)--(1.6,.4,1.7); //right
draw(surface(p -- cycle),emissive(colortwofill),meshpen=colortwo);
path3 p =  (1.6,0.3,0)--(1.6,.4,0) -- (1.6,0.4,1.7)--(1.6,.3,1.7); //back
draw(surface(p -- cycle),emissive(colortwofill),meshpen=colortwo);
path3 p =  (1.8,0.3,0)--(1.8,.4,0) -- (1.8,0.4,1.7)--(1.8,.3,1.7); //front
draw(surface(p -- cycle),emissive(colortwofill),meshpen=colortwo);
path3 p =  (1.6,0.3,0)--(1.8,.3,0)--(1.8,.4,0)--(1.6,.4,0); //bottom
draw(surface(p -- cycle),emissive(colortwofill),meshpen=colortwo);

include apexconfig;

//ASY file for fig:double_intro3 in Chapter 13 sec:double_int_volume

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(5,5.5,1.8);

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

//Create a shaded slice

path3 p = (1.6,-0.65,0)--(1.6,0.65,0) -- (1.6,0.65,1.65)..(1.6,0,1.8)..(1.6,-0.65,1.65)--cycle; 
draw(surface(p),emissive(colortwofill));
draw(p,colortwo);

triple f(pair t) {
  return (t.x,t.y,-.5*(t.x-1)^2-.5*(t.y)^2+2);
}
surface s=surface(f,(-0.221,-1),(2.2,1),12,20,
	vsplinetype=new splinetype[] {notaknot,notaknot,monotonic},
	usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=colorone);

triple g(real t) {return (cos(t)*(1+cos(2*t)),sin(t)*(1+cos(2*t)),0);}
path3 mypath=graph(g,-pi/2,pi/2,operator ..);
draw(mypath,colorone+.4mm);
label("$R$",(0.5,0.6,0),E);

triple gg(real t) {
  return (cos(t)*(1+cos(2*t)),
  	  sin(t)*(1+cos(2*t)),
	  -.5*(cos(t)*(1+cos(2*t))-1)^2-.5*(sin(t)*(1+cos(2*t)))^2+2);
}
path3 mypath=graph(gg,-pi/2,pi/2,operator ..);
draw(mypath,colorone+.4mm);

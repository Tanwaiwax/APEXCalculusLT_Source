include apexconfig;

//ASY file for fig:disk0a in section sec:disk

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((8.1,15.5,23.4),(0,1,0),(0,0,0),1,(-0.13,0.0046));

// setup and draw the axes
real[] myxchoice={3,5};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-0.25,8);
pair ybounds=(-8,8);
pair zbounds=(-8,8);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f1(real t) {
  return (t,t,t);
}
triple f2(real t) {
  return (t,-t,t);
}
triple f3(real t) {
  return (t,t,-t);
}
triple f4(real t) {
  return (t,-t,-t);
}
//path3 mypath1=graph(f1,2.8,3.2,operator ..);
//draw(mypath1,blue+.3mm);

real x1=2.8;
real x2=3.2;

path3 p1=f1(x1)--f1(x2)--f2(x2)--f2(x1)--cycle;
draw(surface(p1),emissive(coloronefill));
draw(p1,colorone+.3mm);

path3 p2=f1(x1)--f1(x2)--f3(x2)--f3(x1)--cycle;
draw(surface(p2), emissive(coloronefill));
draw(p2,colorone+.3mm);

path3 p3=f4(x1)--f4(x2)--f3(x2)--f3(x1)--cycle;
draw(surface(p3), emissive(coloronefill));
draw(p3,colorone+.3mm);

path3 p4=f4(x1)--f4(x2)--f2(x2)--f2(x1)--cycle;
draw(surface(p4), emissive(coloronefill));
draw(p4,colorone+.3mm);

path3 p5=f1(x1)--f3(x1)--f4(x1)--f2(x1)--cycle;
draw(surface(p5), emissive(coloronefill));
draw(p5,colorone+.3mm);

path3 p6=f1(x2)--f3(x2)--f4(x2)--f2(x2)--cycle;
draw(surface(p6), emissive(coloronefill));
draw(p6,colorone+.3mm);

label("$\Delta x$",f3(3),N);

path3 p=(5,5,5)--(5,-5,5)--(5,-5,-5)--(5,5,-5)--cycle;
draw(p,colorone+.2mm+dashed);

path3 p1=(0,0,0)--(5,5,5);
draw(p1,colorone+.2mm+dashed);

path3 p2=(0,0,0)--(5,-5,-5);
draw(p2,colorone+.2mm+dashed);

path3 p3=(0,0,0)--(5,5,-5);
draw(p3,colorone+.2mm+dashed);

path3 p4=(0,0,0)--(5,-5,5);
draw(p4,colorone+.2mm+dashed);

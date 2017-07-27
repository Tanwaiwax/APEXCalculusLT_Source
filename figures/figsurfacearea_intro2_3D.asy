include apexconfig;

//ASY file for fig:sa_intro in Chapter 13 sec:surface_area

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(3,3.5,4.8);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(0,1.25);
pair ybounds=(0,1.2);
pair zbounds=(0,2.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,-t.x^2+2);
}
surface s=surface(f,(0,0),(1,1.2),12,12,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw the box in the plane and on the surface
path3 pp=(.6,.4,0)--(.6,.6,0)--(.8,.6,0)--(.8,.4,0)--cycle;
draw(pp,colorone);
label("$\Delta y_i$",(.9,.5,0));label("$\Delta x_i$",(.7,.7,0));
path3 ppp=(.6,.4,2-.6^2)--(.6,.6,2-.6^2)--(.8,.6,2-.8^2)--(.8,.4,2-.8^2)--cycle;
draw(ppp,colorone);
draw(surface(ppp),coloronefill,meshpen=colorone);
label("$\vec{v}$",(.9,.5,2-.85^2));label("$\vec{u}$",(.7,.7,2-.7^2));

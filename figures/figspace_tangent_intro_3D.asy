include apexconfig;

//ASY file for fig:space_tangent_intro in Chapter 12 sec:multi_tangent

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(8,8,13);

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={2};
real[] myzchoice={10};

pair xbounds=(-0.5,3);
pair ybounds=(-0.5,3);
pair zbounds=(-0.5,11);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,-t.x^2-.5*(t.y^2)+t.x*t.y+10);
}
surface s=surface(f,(0,0),(3,3),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//plot point on surface
dotfactor=3;
dot((2,1,7.5));

//Draw traces on the surface
triple g(real t) {return (2,t,-4-0.5*t^2+2*t+10);}
path3 mypath=graph(g,0,3,operator ..);
draw(mypath,colorone);
triple g(real t) {return (t,1,-t^2-0.5+t+10);}
path3 mypath=graph(g,0,3,operator ..);
draw(mypath,colorone);
triple g(real t) {return (t,3-t,-t^2-0.5*(3-t)^2+(3-t)*t+10);}
path3 mypath=graph(g,0,3,operator ..);
draw(mypath,colorone);


//Draw tangent lines on the surface with gradient (-3,1)
//L1 = (2,1,7.5)+t(1,0,-3) for t=-1,1
draw((1,1,10.5)--(3,1,4.5),colortwo);
//L2 = (2,1,7.5)+t(0,1,1) for t=-1,1
draw((2,0,6.5)--(2,2,8.5),colortwo);
//L3 = (2,1,7.5)+t(0.707,-0.707,-2.828) for t=-1,1
draw((1.293,1.707,10.328)--(2.707,0.293,4.672),colortwo);

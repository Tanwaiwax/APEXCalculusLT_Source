include apexconfig;

// asy file for fig:ex_sq_and_rt in 07_Disk_Washer_Method

size(200,200,IgnoreAspect);
currentprojection=orthographic((10.17,5.3,46),(0,1,0),(0,0,0),1,(-0.0999,0.0072));

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-1.1,1.1);
pair ybounds=(-.1,1.1);
pair zbounds=(-3.2,3.2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


triple g1(real t) {return (t,(t^2),0);}
path3 p1=graph(g1,0,1,operator ..);
draw(p1,colorone+.4mm);

triple g2(real t) {return ((t^2),t,0);}
path3 p2=graph(g2,0,1,operator ..);
draw(p2,colortwo+.4mm);

//draw(surface(p1--p2--cycle), emissive(coloronefill));
// results in "warning [subdivisions]: too many subdivisions"
draw(surface(p1--cycle), emissive(coloronefill));
draw(surface(p2--cycle), emissive(coloronefill));

triple f2(pair t) {return (cos(t.x)*t.y,.5,sin(t.x)*t.y);}
surface s2=surface(f2,(0,.25),(2*pi,.71),16,1,Spline);
draw(s2,emissive(colortwofill));

triple g3(real t) {return (.71*cos(t),.5,.71*sin(t));}
path3 p3=graph(g3,0,2*pi,operator ..);
draw(p3,colorone+.4mm);

triple g3(real t) {return (.25*cos(t),.5,.25*sin(t));}
path3 p3=graph(g3,0,2*pi,operator ..);
draw(p3,colortwo+.4mm);

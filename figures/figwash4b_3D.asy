include apexconfig;

// asy file for fig:wash4 in 07_Disk_Washer_Method

size(200,200,IgnoreAspect);
currentprojection=orthographic((10.17,5.3,46),(0,1,0),(0,0,0),1,(-0.0999,0.0072));

// setup and draw the axes
real[] myxchoice={1,2,3};
real[] myychoice={-5,5};
real[] myzchoice={};

pair xbounds=(-.8,1.4);
pair ybounds=(-.2,4.2);
pair zbounds=(-2.2,2.2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

path3 p3=(xbounds.x,2,0)--(xbounds.y,2,0);
draw(p3,black+.4mm+dashed);

triple f2(pair t) {return (t.x,2+cos(t.y)*(2-sqrt(t.x)),sin(t.y)*(2-sqrt(t.x)));}
surface s2=surface(f2,(0,0),(1,2*pi),4,16,Spline);
draw(s2,emissive(colortwofill),meshpen=colortwo);

triple f2(pair t) {return (t.x,2+cos(t.y)*(2-t.x),sin(t.y)*(2-t.x));}
surface s2=surface(f2,(0,0),(1,2*pi),4,16,Spline);
draw(s2,emissive(coloronefill),meshpen=colorone);

path3 p3=circle((0,2,0),2,X);
draw(p3,black+.4mm);

path3 p3=circle((1,2,0),1,X);
draw(p3,black+.4mm);

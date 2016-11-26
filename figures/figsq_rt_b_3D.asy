include apexconfig;

// asy file for fig:ex_sq_and_rt in 07_Disk_Washer_Method

size(200,200,IgnoreAspect);
currentprojection=orthographic((10.17,5.3,46),(0,1,0),(0,0,0),1,(-0.0999,0.0072));

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={1};
real[] myzchoice={};

pair xbounds=(-1.3,1.2);
pair ybounds=(-.2,1.2);
pair zbounds=(-1.2,1.2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


triple f2(pair t) {return (t.x*cos(t.y),sqrt(t.x),sin(t.y)*t.x);}
surface s2=surface(f2,(0,0),(1,2*pi),4,16,Spline);
draw(s2,emissive(colortwofill),meshpen=colortwo);

triple f2(pair t) {return (t.x*cos(t.y),t.x*t.x,sin(t.y)*t.x);}
surface s2=surface(f2,(0,0),(1,2*pi),4,16,Spline);
draw(s2,emissive(coloronefill),meshpen=colorone);

draw(circle((0,1,0),1,Y),black+.4mm);

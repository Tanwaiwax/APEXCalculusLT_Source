include apexconfig;

//ASY file for fig:parsurfarea in Section 14.5, developing surface area

size(200,200,IgnoreAspect);
currentprojection=orthographic(15.5,18.6,18.1,true,true);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-.1,1.5);
pair ybounds=(-.1,1.5);
pair zbounds=(-.1,2.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple ff(pair t) {
	return (t.y*(cos(t.x)+.1*sin(3t.x)),t.y*sin(t.x),2-(t.y*(cos(t.x)+.1*sin(3t.x)))^2-(t.y*sin(t.x))^2);//
}

triple f(pair t) {
	return -ff(t)+(1,1,3);
}

surface s=surface(f,(0,0),(2pi/4,1),4,16,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

surface s=surface(f,(2pi/16,9/16),(4pi/16,11/16),8,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(colortwofill),meshpen=invisible);

real u0=2pi/16;
real v0=9/16;
real du=2pi/16;
real dv=2/16;
triple ru=f((u0+du,v0))-f((u0,v0));
triple rv=f((u0+du,v0))-f((u0,v0+dv));
pen curvepen2=.3mm+colortwo;

draw(f((u0+du,v0))--f((u0,v0)),curvepen2,Arrow3(5));
draw(f((u0+du,v0))--f((u0+du,v0+dv)),curvepen2,Arrow3(5));

label("\scriptsize$P$",f((u0+du,v0))+(.05,-.05,.1));
label("\scriptsize$M$",f((u0,v0))+(0,+.1,.1));
label("\scriptsize$\scriptsize Q$",f((u0+du,v0+dv))+(.05,-.05,.1));

dot(f((u0+du,v0)),.7mm+black);
dot(f((u0,v0)),.7mm+black);
dot(f((u0+du,v0+dv)),.7mm+black);

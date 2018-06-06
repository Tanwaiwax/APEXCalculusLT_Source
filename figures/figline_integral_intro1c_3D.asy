include apexconfig;

//ASY file for fig:lineint0 in Section 14.1

size(200,200,IgnoreAspect);
currentprojection=orthographic(1.17,4.69,2.35);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={1};
real[] myzchoice={1,2};
pair xbounds=(-1.5,1.5);
pair ybounds=(-.2,1.5);
pair zbounds=(-.1,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f1(pair t) {
	return (t.x,-.75/.5*(t.x+1)+1,t.y*(.664));
}
surface s1=surface(f1,(-1,0),(-.5,1),1,1,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colortwo+linewidth(1);
draw(s1,emissive(colortwofill),meshpen=p);

triple f2(pair t) {
	return (t.x,-.5*(t.x+.5)+.25,t.y*(.89));
}
surface s2=surface(f2,(-.5,0),(0,1),1,1,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colortwo+linewidth(1);
draw(s2,emissive(colortwofill),meshpen=p);

triple f3(pair t) {
	return (t.x,.5*(t.x-.5)+.25,t.y*(.89));
}
surface s3=surface(f3,(0,0),(.5,1),1,1,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colortwo+linewidth(1);
draw(s3,emissive(colortwofill),meshpen=p);

triple f4(pair t) {
	return (t.x,.75/.5*(t.x-1)+1,t.y*(.664));
}
surface s4=surface(f4,(.5,0),(1,1),1,1,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colortwo+linewidth(1);
draw(s4,emissive(colortwofill),meshpen=p);

triple g(real t) {return (t,t^2,-cos(t)*sin(t^2)+1);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colorone+linewidth(2));

triple g(real t) {return (t,t^2,0);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colorone+linewidth(2)+dashed);


include apexconfig;

// ASY file for fig:linescalarfield2 in Section 14.1

size(200,200,IgnoreAspect);
currentprojection=orthographic(10,7.25,3.75);

// setup and draw the axes
real[] myxchoice={-1,3};
real[] myychoice={-1,3};
real[] myzchoice={3};
pair xbounds=(-1.2,3.4);
pair ybounds=(-1.2,3.4);
pair zbounds=(-.1,3.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
	return (t.x,2*t.x+1,t.y*(-sin(t.x*2+1)+cos(t.x)+2));
}
surface s=surface(f,(-1,0),(1,1),8,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

triple g(real t) {return (t,2*t+1,-sin(2t+1)+cos(t)+2);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colorone+linewidth(2));

triple g(real t) {return (t,2*t+1,0);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colorone+linewidth(2)+dashed);

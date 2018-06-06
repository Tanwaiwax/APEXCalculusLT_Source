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

triple f(pair t) {
	return (t.x,t.y,-sin(t.y)*cos(t.x)+1);
}
surface s=surface(f,(-1,-.1),(1,1),16,16,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

triple g(real t) {return (t,t^2,-cos(t)*sin(t^2)+1);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colorone+linewidth(2));

triple g(real t) {return (t,t^2,0);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colorone+linewidth(2)+dashed);

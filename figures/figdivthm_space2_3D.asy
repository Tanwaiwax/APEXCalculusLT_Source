include apexconfig;

//ASY file for fig:divthm_space2 in sec:stokes_divergence

size(200,200,IgnoreAspect);
currentprojection=orthographic(-17,32,12.6);

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={-1,1};
real[] myzchoice={2};

pair xbounds=(-.1,1.2);
pair ybounds=(-1.3,1.3);
pair zbounds=(-.1,2.2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the planar parabola
triple f(pair t) {
	return (t.y*(1-t.x^2),t.x,0);//
}
surface s=surface(f,(-1,0),(1,1),8,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colortwo;
draw(s,emissive(colortwofill),meshpen=p);

//Draw plane over parabola
triple f(pair t) {
	return (t.y*(1-t.x^2),t.x,2*t.y*(1-t.x^2));//
}
surface s=surface(f,(-1,0),(1,1),8,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

//Draw parabolic cylinder side
triple f(pair t) {
	return ((1-t.x^2),t.x,2*t.y*(1-t.x^2));//
}
surface s=surface(f,(-1,0),(1,1),8,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

pen curvepen=.4mm+colorone;
triple f(real t) {return (1-t^2,t,0);}
path3 mypath=graph(f,-1,1,operator ..);
draw(mypath,curvepen);

triple f(real t) {return (1-t^2,t,2*(1-t^2));}
path3 mypath=graph(f,-1,1,operator ..);
draw(mypath,curvepen);

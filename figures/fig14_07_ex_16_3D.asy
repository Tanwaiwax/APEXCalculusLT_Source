include apexconfig;

//ASY file for 14.7 exset 3

size(200,200,IgnoreAspect);
currentprojection=orthographic(14,14,4);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-2,2};
real[] myzchoice={1};

pair xbounds=(-2.5,2.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-0.25,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x,t.y,1-t.x^2);//
}
surface s=surface(f,(-1,-2),(1,2),8,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x,-2,t.y*(1-t.x^2));//
}
surface s=surface(f,(-1,0),(1,1),8,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x,2,t.y*(1-t.x^2));//
}
surface s=surface(f,(-1,0),(1,1),8,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (t.x,t.y,0);//
}
surface s=surface(f,(-1,-2),(1,2),2,2,Spline);
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

triple g(real t) {return (t,-2,1-t^2);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colorone+linewidth(2));

triple g(real t) {return (t,2,1-t^2);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colorone+linewidth(2));

draw((1,-2,0)--(1,2,0)--(-1,2,0)--(-1,-2,0)--cycle,colorone+linewidth(2));

//label and arrow
label("$z=1-x^2$",(0,1,1.55));
draw((0,.9,1.45)--(0,.5,1.05),Arrow3(size=2mm));

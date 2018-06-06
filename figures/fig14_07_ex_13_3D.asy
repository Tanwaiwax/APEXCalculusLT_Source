include apexconfig;

//ASY file for 14.7 exset 3

size(200,200,IgnoreAspect);
currentprojection=orthographic(12,12,5);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-1,1};
real[] myzchoice={-1,1};

pair xbounds=(-1.25,1.25);
pair ybounds=(-1.25,1.25);
pair zbounds=(-0.25,1.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

draw((-1,-1,0) -- (-1,1,0) -- (1,1,0) -- (1,-1,0)--cycle,colorone+linewidth(2));

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x,t.y,(t.x^2-1)*(t.y^2-1));//
}
surface s=surface(f,(-1,-1),(1,1),8,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x,t.y,0);//
}
surface s=surface(f,(-1,-1),(1,1),1,1,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

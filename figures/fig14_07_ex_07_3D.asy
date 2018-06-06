include apexconfig;

//ASY file for 14.7 exset 1

size(200,200,IgnoreAspect);
currentprojection=orthographic(12,12,10);

// setup and draw the axes
real[] myxchoice={3};
real[] myychoice={3};
real[] myzchoice={4};

pair xbounds=(-.5,3.5);
pair ybounds=(-.5,3.5);
pair zbounds=(-.5,4.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

draw((0,0,0) -- (3,0,0) -- (3,3,0) -- (0,3,0)--cycle,colorone+linewidth(2));

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x,t.y,t.x*t.y*(3-t.x)*(3-t.y));//
}
surface s=surface(f,(0,0),(3,3),8,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x,t.y,0);//
}
surface s=surface(f,(0,0),(3,3),1,1,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

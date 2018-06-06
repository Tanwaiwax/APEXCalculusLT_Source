include apexconfig;

//ASY file for 14.7 exset 2

size(200,200,IgnoreAspect);
currentprojection=orthographic(12,12,10);

// setup and draw the axes
real[] myxchoice={4};
real[] myychoice={3};
real[] myzchoice={2};

pair xbounds=(-.5,4.5);
pair ybounds=(-.5,4.5);
pair zbounds=(-0.25,2.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x,t.y*(3-3t.x/4),2-t.x/2-2*(t.y*(3-3t.x/4))/3);//
}
surface s=surface(f,(0,0),(4,1),1,1,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

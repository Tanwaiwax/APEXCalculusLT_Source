include apexconfig;

//ASY file for 14.7 exset 4

size(200,200,IgnoreAspect);
currentprojection=orthographic(11,11,80);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-1,1};
real[] myzchoice={5,10,15};

pair xbounds=(-1.25,1.25);
pair ybounds=(-1.25,1.25);
pair zbounds=(-.25,18);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x,t.y,10-5t.x-2t.y);//
}
surface s=surface(f,(-1,-1),(1,1),3,3,Spline);
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

draw((1,1,3)--(-1,1,13)--(-1,-1,17)--(1,-1,7)--cycle,colorone+linewidth(2));


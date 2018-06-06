include apexconfig;

//ASY file for 14.7 exset 4

size(200,200,IgnoreAspect);
currentprojection=orthographic(-10,22,1);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={1};
real[] myzchoice={.25};

pair xbounds=(-1.25,1.25);
pair ybounds=(-.25,1.25);
pair zbounds=(-.25,.3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.x-1+t.y*(2-2*t.x),t.x,(t.x-1+t.y*(2-2*t.x))*t.x);//
}
surface s=surface(f,(0,0),(1,1),8,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

triple g(real t) {return (t,0,0);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colorone+linewidth(2));

triple g(real t) {return (t,1-t,t*(1-t));}
path3 mypath=graph(g,0,1,operator ..);
draw(mypath,colorone+linewidth(2));

triple g(real t) {return (t,t+1,t*(t+1));}
path3 mypath=graph(g,-1,0,operator ..);
draw(mypath,colorone+linewidth(2));

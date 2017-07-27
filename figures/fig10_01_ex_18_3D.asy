include apexconfig;

//ASY file for 10_01_exset_02 solution in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(-8,41,2.5);

// setup and draw the axes
real[] myxchoice={-10,10};
real[] myychoice={-10,10};
real[] myzchoice={-5,5};

pair xbounds=(-12,12);
pair ybounds=(-12,12);
pair zbounds=(-6,6);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface y=1/x
triple f(pair t) {
	return (t.x,1/t.x,t.y);
}
surface s=surface(f,(0.1,-3),(10,3),16,8);
draw(s,emissive(coloronefill),meshpen=colorone);
surface s=surface(f,(-10,-3),(-.1,3),16,8);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw the traces (in this case vertical lines)
triple g(real t) {return (1,1,t);}
path3 mypath=graph(g,-3,3,operator ..);
draw(mypath,colortwo);
triple g(real t) {return (-1,-1,t);}
path3 mypath=graph(g,-3,3,operator ..);
draw(mypath,colortwo);
triple g(real t) {return (5,.2,t);}
path3 mypath=graph(g,-3,3,operator ..);
draw(mypath,colortwo);
triple g(real t) {return (-5,-.2,t);}
path3 mypath=graph(g,-3,3,operator ..);
draw(mypath,colortwo);
triple g(real t) {return (10,.1,t);}
path3 mypath=graph(g,-3,3,operator ..);
draw(mypath,colortwo);
triple g(real t) {return (-10,-.1,t);}
path3 mypath=graph(g,-3,3,operator ..);
draw(mypath,colortwo);

triple g(real t) {return (t,1/t,0);}
path3 mypath=graph(g,.1,10,operator ..);
draw(mypath,colorone);
path3 mypath=graph(g,-10,-.1,operator ..);
draw(mypath,colorone);

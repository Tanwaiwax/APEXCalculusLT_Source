include apexconfig;

//ASY file for fig:stokes2 in sec:stokes_divergence

size(200,200,IgnoreAspect);
currentprojection=orthographic(11,19,27);

// setup and draw the axes
real[] myxchoice={1,2};
real[] myychoice={1,2};
real[] myzchoice={2,4,6,8};

pair xbounds=(-.1,2.5);
pair ybounds=(-.1,2.5);
pair zbounds=(-.1,9);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the plane  z=6-x^2-y^2
triple f(pair t) {
	return (t.x,t.y,6-t.x^2-t.y^2);//
}
surface s=surface(f,(-.1,-.1),(2.2,2.2),16,16,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

triple g(real t) {return (cos(t)+1,sin(t)+1,6-(cos(t)+1)^2-(sin(t)+1)^2);}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,colorone+linewidth(2));

triple g(real t) {return (cos(t)+1,sin(t)+1,0);}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,colorone+dashed+linewidth(1));

label("$\mathcal{S}$",(1,1,5));

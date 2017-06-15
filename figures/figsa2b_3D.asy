include apexconfig;

//ASY file for fig:sa2 in Chapter 7 section sec:arc_length

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((10.4,3.7,64),(0,1,0),(0,0,0),.95,(0.00404,0.00136));

// setup and draw the axes
real[] myxchoice={1,-1};
real[] myychoice={-1,1};
real[] myzchoice={};

pair xbounds=(-1.5,1.5);
pair ybounds=(-.1,1.1);
pair zbounds=(-1.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f2(pair t) {return (t.x*sin(t.y),t.x^2,t.x*cos(t.y));}
surface s2=surface(f2,(0,0),(1,2*pi),8,16,
	usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
	vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s2,emissive(coloronefill),meshpen=colorone);

triple g3(real t) {return (t,t^2,0);}
path3 p3=graph(g3,0,1,operator ..);
draw(p3,colorone+.6mm);

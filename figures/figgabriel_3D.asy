include apexconfig;

//ASY file for fig:gabriel in Chapter 7 section sec:arc_length

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((372,29,113),(0,1,0),(0,0,0),.95,(-0.024,-0.0032));

// setup and draw the axes
real[] myxchoice={5,10,15};
real[] myychoice={-1,1};
real[] myzchoice={};

pair xbounds=(-1,17);
pair ybounds=(-1.3,1.3);
pair zbounds=(-1.3,1.3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f2(pair t) {return (t.x,1/t.x*sin(t.y),1/t.x*cos(t.y));}
surface s2=surface(f2,(1,0),(15,2*pi),16,16,
	usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
	vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s2,emissive(coloronefill),meshpen=colorone);

triple g3(real t) {return (t,1/t,0);}
path3 p3=graph(g3,1,15,16,operator ..);
draw(p3,colorone+.6mm);

draw((0,-2,0)--(0,2,0),invisible);

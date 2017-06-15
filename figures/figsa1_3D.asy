include apexconfig;

//ASY file for fig:sa1 in Chapter 7 section sec:arc_length

size(200,200,IgnoreAspect);
currentprojection=orthographic((16.7,13.2,46),(0,1,0),(0,0,0),1,(-.0323,0.0012));


// setup and draw the axes
real[] myxchoice={};
real[] myychoice={-1,1};
real[] myzchoice={};

pair xbounds=(-.1,3.5);
pair ybounds=(-1.5,1.5);
pair zbounds=(-1.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//\addplot3[domain=.9:1.4,y domain=-210:150,samples y=36,surf,shader=flat,colormap={mp2}{\colormapone}]
// ({x},{(.41*(x-.9)+.78)*sin(y)},{(.41*(x-.9)+.78)*cos(y)});

//\addplot3[domain=.5:1.9,,samples y=0,{\colorone},] ({x},{0},{(sin(deg(x)))});

//\addplot3[domain=0:360,,samples y=0,black,smooth] ({1.4},{.98*cos(x)},{.98*sin(x)});

//\addplot3[domain=130:330,,samples y=0,black,dashed,smooth] ({.9},{.78*cos(x)},{.78*sin(x)});

//pen p=rgb(0,0,.8)+.1mm;

triple f2(pair t) {return (t.x,sin(t.x)*sin(t.y),sin(t.x)*cos(t.y));}
surface s2=surface(f2,(0,0),(pi,2*pi),16,16,
	usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
	vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s2,emissive(coloronefill),meshpen=colorone);

triple g3(real t) {return (t,sin(t),0);}
path3 p3=graph(g3,0,pi,32,operator ..);
draw(p3,colorone+.6mm);

draw((pi,.05,0)--(pi,-.05,0),black+.2mm);
label("$\pi$",(pi,-.05,0),S);

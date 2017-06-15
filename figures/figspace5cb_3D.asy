include apexconfig;

//ASY file for fig:space5c in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4.5,3,2.7);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-1.5,1.5);
pair ybounds=(-1.5,1.5);
pair zbounds=(-1.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface z^2 = y^2 - x^2
triple f(pair t) {
	return (t.x,t.y,-(t.x)^2+(t.y)^2);
}
surface s=surface(f,(-1,-1),(1,1),32,16);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw the traces for x=0
triple g(real t) {return (0,t,t^2);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colortwo);

//Draw the traces for y=0
triple g(real t) {return (t,0,-t^2);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colortwo);

include apexconfig;

//ASY file for fig:disk2 in Chapter 7 section sec:disk

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((24.2,2.9,24.5),(0,1,0),(0,0,0),.95,(0.011,0.0033));

// setup and draw the axes
real[] myxchoice={-2,-1,1,2};
real[] myychoice={1};
real[] myzchoice={};

pair xbounds=(-2.3,2.3);
pair ybounds=(-.2,1.2);
pair zbounds=(-2.3,2.3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple g(real t) {return (t,1/t,0);}
path3 mypath=graph(g,1.005,1.99,operator ..);
draw(mypath,colorone+linewidth(2));

triple f(pair t) {return (1/t.x*cos(t.y),t.x,1/t.x*sin(t.y));}
surface s=surface(f,(.5,0),(1,2*pi),5,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

path3 p1=circle((0,1,0),1,Y);//(1,1,0)..(0,1,1)..(-1,1,0)..(0,1,-1);
draw(surface(p1),emissive(coloronefill));
draw(p1,colorone+.4mm);

path3 p2=circle((0,.5,0),2,Y);//(2,.5,0)..(0,.5,2)..(-2,.5,0)..(0,.5,-2);
draw(surface(p2),emissive(coloronefill));
draw(p2,colorone+.4mm);

path3 p=circle((0,2/3,0),3/2,Y);//(3/2,2/3,0)..(0,2/3,3/2)..(-3/2,2/3,0)..(0,2/3,-3/2);
draw(surface(p),emissive(colortwofill));
draw(p,colortwo+.4mm);

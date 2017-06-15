include apexconfig;

//ASY file for fig:disk1 in Chapter 7 section sec:disk

size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((18,7.7,21.1),(0,1,0),(0,0,0),1,(-0.088,.0039));

// setup and draw the axes
real[] myxchoice={1,2};
real[] myychoice={.5,1};
real[] myzchoice={};

pair xbounds=(-0.1,2.2);
pair ybounds=(-1.2,1.2);
pair zbounds=(-1.2,1.2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

path3 p2=circle((1,0,0),1,X);
draw(surface(p2),emissive(coloronefill));
draw(p2,colorone+.4mm);

triple f(pair t) {return (t.x,1/t.x*cos(t.y),1/t.x*sin(t.y));}
surface s=surface(f,(1,0),(2,2*pi),5,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

path3 p1=circle((2,0,0),.5,X);
draw(surface(p1), emissive(coloronefill));
draw(p1,colorone+.4mm);

path3 p=circle((3/2,0,0),2/3,X);
draw(surface(p), emissive(colortwofill));
draw(p,colortwo+.4mm);

triple g(real t) {return (t,1/t,0);}
path3 mypath=graph(g,1.01,1.99,operator ..);
draw(mypath,colorone+linewidth(2));

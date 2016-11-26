include apexconfig;

//ASY file for figdisk1.asy in Chapter 7

currentprojection=orthographic((18,7.7,21.1),(0,1,0),(0,0,0),1,(-0.088,.0039));
size(200,200,IgnoreAspect);

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



path3 p=(3/2,2/3,0)..(3/2,0,2/3)..(3/2,-2/3,0)..(3/2,0,-2/3);
draw(surface(p .. cycle), emissive(colortwofill));
draw(p..cycle,colortwo+.4mm);

triple g(real t) {return (t,1/t,0);}
path3 mypath=graph(g,1,2,operator ..);
draw(mypath,colorone+linewidth(2));

draw((1.5,0,0)--(1.5,2/3,0),black+.3mm);

triple pt=(1.3,Sin(-20),Cos(-20));

draw(pt--(1.48,.3,.05),linewidth(.75),Arrow3);
label("$R(x)=1/x$",pt,S);

label("$y=1/x$",(1,1,0),N);

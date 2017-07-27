include apexconfig;

//ASY file for exercise 11_01_exset_02 solution in Chapter 11 sec:vvf

size(200,200,IgnoreAspect);
currentprojection=orthographic(2,4,2);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={2,4,6};
real[] myzchoice={-1,1};

pair xbounds=(-3,3);
pair ybounds=(-1,7);
pair zbounds=(-3,3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple g(real t) {return (2*cos(t),t,2*sin(t));}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colorone);

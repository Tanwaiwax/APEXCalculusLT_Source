include apexconfig;

//ASY file for fig:surfrev1 in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-1,1};
real[] myzchoice={2};

pair xbounds=(-1.25,1.25);
pair ybounds=(-1.25,1.25);
pair zbounds=(-0.25,pi+.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the curve x=sin(z)
triple g(real t) {return (sin(t),0,t);}
path3 mypath=graph(g,0,pi,operator ..);
draw(mypath,colortwo);
label("$x=\sin(z)$",(.5,0,1.75));

//Draw the curve y=sin(z)
triple g(real t) {return (0,sin(t),t);}
path3 mypath=graph(g,0,pi,operator ..);
draw(mypath,colorone);
label("$y=\sin(z)$",(0,.5,1.75));

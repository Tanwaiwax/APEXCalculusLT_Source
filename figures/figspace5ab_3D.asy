include apexconfig;

//ASY file for fig:space5a in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(15,5,4.5);

// setup and draw the axes
real[] myxchoice={-4,4};
real[] myychoice={1,2};
real[] myzchoice={-4,4};

pair xbounds=(-4.5,4.5);
pair ybounds=(-0.5,2.5);
pair zbounds=(-4.5,4.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the traces for x=0
triple g(real t) {return (0,t^2/16,t);}
path3 mypath=graph(g,-4,4,operator ..);
draw(mypath,colortwo);

//Draw the traces for z=0
triple g(real t) {return (t,t^2/4,0);}
path3 mypath=graph(g,-2,2,operator ..);
draw(mypath,colortwo);

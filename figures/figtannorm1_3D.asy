include apexconfig;

//ASY file for fig:tannorm1 in Chapter 11 sec:tan_norm

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(10,5,23);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={-10,10};

pair xbounds=(-4,4);
pair ybounds=(-4,4);
pair zbounds=(-15,15);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the curve <3cos t,3sin t,4t> for t from -pi to pi
triple g(real t) {return (3*cos(t),3*sin(t),4*t);}
path3 mypath=graph(g,-pi,pi,operator ..);
draw(mypath,colorone);
//Draw the unit tangents at t=0 and t=1
draw((3,0,0)--(3,.6,.8),colortwo+linewidth(2),Arrow3(size=3mm));//T
draw((1.62,2.52,4)--(1.12,2.85,4.8),colortwo+linewidth(2),Arrow3(size=3mm));//N

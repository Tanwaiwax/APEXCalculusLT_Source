include apexconfig;

//ASY file for fig:lines3 in Chapter 10 section sec:lines

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(10,26,7);

// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={10};
real[] myzchoice={-5,5};

pair xbounds=(-1,4.5);
pair ybounds=(-1,11);
pair zbounds=(-6,6);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//draw P1 and vector d1 at P1
dotfactor=3;
dot((-0.7,4.2,2.3));
label("$P_1$",(-0.7,4.2,2.3),E);
label("$\vec{d}_1$",(0.9+.5,6.92,-1.06),W);

dotfactor=3;
dot((2.8,10.15,-5.05));
label("$P_2$",(2.8,10.15,-5.05),W);
//draw((2.8,10.15,-5.05)--(-.1,5.22,1.04),black,Arrow3(size=2mm));
label("$\vec{d}_2$",(-.1-.5,5.22,1.04),E);

//draw the line L ({-0.7+1.6t},{4.2+2.72t},{2.3-3.36t}) 
draw((3.3,11,-6.1)--(-2.3,1.48,5.66),colorone);

draw((2.8-.5,10.15,-5.05)--(-.1-.5,5.22,1.04),colortwo,Arrow3(size=2mm));
draw((-0.7+.5,4.2,2.3)--(0.9+.5,6.92,-1.06),colortwo,Arrow3(size=2mm));

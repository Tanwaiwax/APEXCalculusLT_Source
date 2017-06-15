include apexconfig;

//ASY file for fig:lines2 in Chapter 10 section sec:lines

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={-5,5};
real[] myychoice={-5,5};
real[] myzchoice={-5,5};

pair xbounds=(-5.5,5.5);
pair ybounds=(-5.5,5.5);
pair zbounds=(-1,6);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//draw P1 and vector d1 at P1
dotfactor=3;
dot((1,2,0));
label("$P_1$",(1,2,0),S);
draw((1,2,0)--(4,1,1),black,Arrow3(size=2mm));
label("$\vec{d}_1$",(4,1,1),N);

//draw P2 and vector d2 at P2
dotfactor=3;
dot((-2,3,5));
label("$P_2$",(-2,3,5),N);
draw((-2,3,5)--(2,4,7),black,Arrow3(size=2mm));
label("$\vec{d}_2$",(2,4,7),S);

//draw the line L1 ({1+3t},{2-t},{t}) in two parts, before P1 and after P1+d1
draw((-2,3,-1)--(1,2,0),colorone);
draw((4,1,1)--(7,0,2),colorone);
label("$\ell_1$",(7,0,2),S);

//draw the line L2 ({-2+4t},{3+t},{5+2t}) in two parts, before P2 and after P2+d2
draw((-6,2,3)--(-2,3,5),colorone);
draw((2,4,7)--(6,5,9),colorone);
label("$\ell_2$",(-6,2,3),S);

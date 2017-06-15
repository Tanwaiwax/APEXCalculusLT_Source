include apexconfig;

//ASY file for fig:cartcoord2 in Chapter 10 section sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={-2,3};

pair xbounds=(-2,2.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-1.5,4);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

draw((0,0,3)--(0,1,3)--(2,1,3)--(2,0,3)--cycle, colortwo+dashed+linewidth(.5));//top
draw((0,0,0)--(0,1,0)--(2,1,0)--(2,0,0)--cycle, colortwo+dashed+linewidth(.5));//top
draw((2,0,0)--(2,0,3), colortwo+dashed+linewidth(.5));//up1
draw((0,1,0)--(0,1,3), colortwo+dashed+linewidth(.5));//up2
draw((2,1,0)--(2,1,3), colortwo+dashed+linewidth(.5));//up
label("$P$",(2,1,3),E);
dotfactor=3;
dot((2,1,3),colorone);

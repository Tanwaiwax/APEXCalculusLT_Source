include apexconfig;

//ASY file for fig:cartcoord1 in Chapter 10 section sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(11,5,2.8);

// setup and draw the axes
real[] myxchoice={-1,1,2,3};
real[] myychoice={-2,-1,1,2};
real[] myzchoice={-2,-1,1,2};

pair xbounds=(-3,3.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-2.5,2.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$z$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$x$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$y$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

// Draw the lines
draw((0,0,1)--(0,2,1)--(3,2,1)--(3,0,1)--(0,0,1), colortwo+dashed+linewidth(.5));//top
draw((0,0,0)--(0,2,0)--(3,2,0)--(3,0,0)--(0,0,0), colortwo+dashed+linewidth(.5));//bottom
draw((3,0,0)--(3,0,1), colortwo+dashed+linewidth(.5));//up1
draw((0,2,0)--(0,2,1), colortwo+dashed+linewidth(.5));//up2
draw((3,2,0)--(3,2,1), colortwo+dashed+linewidth(.5));//up3
label("$P$",(3,2,1),E);
dotfactor=3;
dot((3,2,1),colorone);

include apexconfig;

//ASY file for fig:vect1 in Chapter 10.1 section sec:vector_intro

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(9,5,2);

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={2};
real[] myzchoice={-2,4};

pair xbounds=(-1,3.5);
pair ybounds=(-1,2.5);
pair zbounds=(-1,5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

// Draw the lines for Q=(1,1,1)
draw((0,0,1)--(0,1,1)--(1,1,1)--(1,0,1)--(0,0,1), colortwo+dashed+linewidth(.5));//top Q
draw((0,0,0)--(0,1,0)--(1,1,0)--(1,0,0)--(0,0,0), colortwo+dashed+linewidth(.5));//bottom Q
draw((1,0,0)--(1,0,1), colortwo+dashed+linewidth(.5));//up1 Q
draw((0,1,0)--(0,1,1), colortwo+dashed+linewidth(.5));//up2 Q
draw((1,1,0)--(1,1,1), colortwo+dashed+linewidth(.5));//up3 Q
label("$Q$",(1,1,1),N);

// Draw the lines for Q'=(3,0,4)
draw((0,0,4)--(0,0,4)--(3,0,4)--(3,0,4)--(3,0,4), colortwo+dashed+linewidth(.5));//top P
draw((0,0,0)--(3,0,0)--(3,0,0)--(3,0,0)--(0,0,0), colortwo+dashed+linewidth(.5));//bottom P
draw((3,0,0)--(3,0,4), colortwo+dashed+linewidth(.5));//up1 P
draw((0,0,0)--(0,0,3), colortwo+dashed+linewidth(.5));//up2 P
draw((3,0,0)--(3,0,3), colortwo+dashed+linewidth(.5));//up3 P
label("$Q'$",(3,0,4),N);

//line from Q to Q'
draw((1,1,1)--(3,0,4), black,Arrow3(size=2mm));

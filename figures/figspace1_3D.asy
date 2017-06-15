include apexconfig;

//ASY file for fig:space1 in Chapter 10 section sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,1);

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={2,4};
real[] myzchoice={-2,2};

pair xbounds=(-1,2.5);
pair ybounds=(-1,4.5);
pair zbounds=(-2.5,2.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

// Draw the lines for Q=(2,1,1)
draw((2,0,0)--(2,1,0)--(0,1,0), colortwo+dashed+linewidth(.5));//top Q
draw((2,1,0)--(2,1,1), colortwo+dashed+linewidth(.5));//up3 Q
label("$Q$",(2,1,1),E);
dotfactor=3;
dot((2,1,1),colorone);

// Draw the lines for P=(1,4,-1)
draw((0,4,0)--(1,4,0)--(1,0,0), colortwo+dashed+linewidth(.5));//bottom P
draw((1,4,0)--(1,4,-1), colortwo+dashed+linewidth(.5));//up3 P
label("$P$",(1,4,-1),E);
dotfactor=3;  dot((1,4,-1),colorone);

//line from P to Q
draw((1,4,-1)--(2,1,1), colorone);

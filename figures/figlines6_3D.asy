include apexconfig;

//ASY file for fig:lines6 in Chapter 10 section sec:lines

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,17,9);

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={-4,4};
real[] myzchoice={-4,4};

pair xbounds=(-1,3);
pair ybounds=(-4.5,4.5);
pair zbounds=(-4.5,4.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//draw vector PQ=<-1,4,-3>
draw((2,-1,2)--(1,3,-1),colortwo,Arrow3(size=2mm));
label("$\overrightarrow{PQ}$",(1.5,1,0.5),S);
dotfactor=3;
dot((2,-1,2));label("P",(2,-1,2),N);
dotfactor=3;
dot((1,3,-1));label("Q",(1,3,-1),N);
//draw the line ({2-t},{-1+4t},{2-3t}) in two parts, before P and after Q
draw((2.5,-3,3.5)--(2,-1,2),colorone);
draw((1,3,-1)--(0.5,5,-2.5),colorone);

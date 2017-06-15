include apexconfig;

//ASY file for fig:lines1 in Chapter 10 section sec:lines

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2.5);

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={5};
real[] myzchoice={5};

pair xbounds=(-1,2.5);
pair ybounds=(-1,5.5);
pair zbounds=(-1,5.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

draw(O--(-1,1,2),black,Arrow3(size=2mm));
label("$\vec{d}$",(-1,0,1),N);
dotfactor=3;
dot((2,3,1));
label("P",(2,3,1),N);
dotfactor=3;
dot((-1,6,6));
label("Q",(-1,6,6),S);
//draw the line ({2-t},{3+t},{1+2t});
draw((3,2,-1)--(-1,6,7),colorone);

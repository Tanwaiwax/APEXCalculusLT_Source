include apexconfig;

//ASY file for fig:lines_intro in Chapter 10 section sec:lines

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-1,1);
pair ybounds=(-1,3.5);
pair zbounds=(-1,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

draw(O--(-1,0,1),colortwo,Arrow3(size=2mm));
label("$\vec{d}$",(-1,0,1),N);
draw(O--(0,2,1),black,Arrow3(size=2mm));
label("$\vec{p}$",(0,2,1),N);
draw(O--(-1,2,2),black,Arrow3(size=2mm));
label("$\vec{p}+\vec{d}$",(-1,2,2),W);
draw(O--(2,2,-1),black,Arrow3(size=2mm));
label("$\vec{p}-2\vec{d}$",(2,2,-1),W);
//draw the line ({-x},{2},{1+x});
draw((2.2,2,-1.2)--(-1.5,2,2.5),colorone);

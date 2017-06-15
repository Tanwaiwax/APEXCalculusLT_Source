include apexconfig;

//ASY file for figvvf23D.asy in Chapter 11 section sec:vvf

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4.5,4.5,20);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-1,1};
real[] myzchoice={5,10};

pair xbounds=(-1.5,1.5);
pair ybounds=(-1.5,1.5);
pair zbounds=(-0.5,15);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the helix <cos t,sin t,t> for t from 0 to 4pi
triple g(real t) {return (cos(t),sin(t),t);}
path3 mypath=graph(g,0,4*pi,operator ..);
draw(mypath,colorone);

//Draw the vector for r(7pi/4)
draw((0,0,0)--(0.707,-0.707,5.498),colortwo+linewidth(2),Arrow3(size=3mm));
label("$\vec{r}(7 \pi/4)$",(0.707,-0.707,5.498),W);

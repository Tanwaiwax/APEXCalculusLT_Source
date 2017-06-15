include apexconfig;

//ASY file for fig:space4a in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-2.25,2.25);
pair ybounds=(-2.25,2.25);
pair zbounds=(-0.25,4.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the parabola z=y^2 for t from -2 to 2
triple g(real t) {return (0,t,t^2);}
path3 mypath=graph(g,-2,2,operator ..);
draw(mypath,colorone);

for ( int n = 0 ; n < 13 ; ++n ) {
  real y = .3*n-1.9;
  draw((-2,y,y^2)--(2,y,y^2),colortwo);
}

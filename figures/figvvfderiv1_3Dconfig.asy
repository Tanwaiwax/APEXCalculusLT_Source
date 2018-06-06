//ASY file for fig:vvfderiv1 in Chapter 11 sec:vvf_calc

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={-2,2};

pair xbounds=(-2.75,2.75);
pair ybounds=(-2.75,2.75);
pair zbounds=(-2.75,2.75);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the curve <t,t^2,t^3> for t from -1.5 to 1.5
triple g(real t) {return (t,t^2,t^3);}
path3 mypath=graph(g,-1.5,1.5,operator ..);
draw(mypath,colorone);

//Draw the line <-1,1,-1>+t<1,-2,3> for t=-0.75 to t=1
draw((-1.75,2.5,-3.25)--(0,-1,2),colortwo+linewidth(1));

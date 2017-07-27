include apexconfig;

//ASY file for fig:dotpangle in Chapter 10 sec:dot_product

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-0.5,2.5);
pair ybounds=(-0.5,2.5);
pair zbounds=(-0.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,-.1*t.x+.3*t.y+.5);
}
surface s=surface(f,(0,0),(2,2),8,8,Spline);
draw(s,emissive(coloronefill),meshpen=colorone,render(merge=true));

// Draw the vectors
draw((0.5,0.5,.6)--(1.5,0.25,.425), black+linewidth(2),Arrow3(size=3mm));//u
draw((0.5,0.5,.6)--(0.25,1.8,1.015), black+linewidth(2),Arrow3(size=3mm));//v
label("$\vec{u}$",(1.5,0.25,.425),N);
label("$\vec{v}$",(0.25,1.8,1.015),N);
dotfactor=3;
dot((0.5,0.5,.6),black);

//Draw the arc with theta
draw((.99,.38,.51)..(.81,.78,.65)..(.41,.97,.75));
label("$\theta$",(0.5,0.5,.7),W);

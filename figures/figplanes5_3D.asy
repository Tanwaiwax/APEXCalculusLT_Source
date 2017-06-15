include apexconfig;

//ASY file for fig:planes5 in Chapter 10 section sec:planes

//size(200,200,Aspect);
size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(5,4,2);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={2};

pair xbounds=(-3,4);
pair ybounds=(-3,4);
pair zbounds=(-2,7);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {return (t.x,t.y,4-2*t.x-t.y);}
surface s=surface(f,(-2,-2),(3,3),8,8,Spline);
draw(s,emissive(coloronefill),meshpen=colorone,render(merge=true));

dotfactor=3;
dot((1,1,1),colortwo);
//label("$P$",(1,1,1),N);

//draw the line 3-t,-3+2t,-1+t 
draw((3,-3,-1)--(0,3,2),colortwo);//L t=0 to t=3
label("$\ell(t)$",(3,-3,-1),N);

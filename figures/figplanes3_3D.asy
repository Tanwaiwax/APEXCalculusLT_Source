include apexconfig;

//ASY file for fig:planes3 in Chapter 10 section sec:planes

size(200,200,Aspect);
//size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={-3,3};
real[] myychoice={-3,3};
real[] myzchoice={-3,3};

pair xbounds=(-4,4);
pair ybounds=(-4,4);
pair zbounds=(-4,4);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {return (t.x,t.y,(-1/2)*(t.x+1)-t.y+1);}
surface s=surface(f,(-3,-3),(3,3),8,8,Spline);
draw(s,emissive(coloronefill),meshpen=colorone,render(merge=true));

dotfactor=3;
dot((-1,0,1));
label("$P$",(-1,0,1),N);

//draw the line -1+t,2t,1+2t 
draw((1,4,5)--(-3,-4,-3),colorone);//L t=2 to t=-2

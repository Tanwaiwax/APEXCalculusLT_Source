include apexconfig;

//ASY file for fig:planes4 in Chapter 10 section sec:planes

//size(200,200,Aspect);
size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(8,14.7,14);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={-5};

pair xbounds=(-3,3);
pair ybounds=(-3,3);
pair zbounds=(-6,2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {return (t.x,t.y,-t.x+t.y-1);}
surface s=surface(f,(-3,-3),(3,3),8,8,Spline);
draw(s,emissive(coloronefill),meshpen=colorone+.2mm,render(merge=true));
triple f(pair t) {return (t.x,t.y,2*t.x-t.y-2);}
surface s=surface(f,(-3,-3),(3,3),8,8,Spline);
draw(s,emissive(colortwofill),meshpen=colortwo,render(merge=true));

dotfactor=3;
dot((1,1,-1));
label("$P$",(1,1,-1),N);

//draw the line 1-2t,1-3t,-1-t 
draw((4,5.5,0.5)--(-2,-3.5,-2.5),colorone);//L t=-1.5 to t=1.5

include apexconfig;

//ASY file for fig:trip5b in Chapter 13 sec:triple_int

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(8.4,6.8,12.6);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={2,4,6};

pair xbounds=(-2.5,2.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-0.5,7);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

// todo find a better way to shade this in
triple region(pair t) {return (t.x,0,t.y*(2*t.x^2+2)+(1-t.y)*(6-2*t.x^2));}
surface surf = surface(region,(-1,0),(1,1));
draw(surf,emissive(coloronefill),meshpen=colorone);

triple topline(real t) {return region((t,0));}
path3 p = graph(topline,-1,1,operator ..);
draw(p,colorone+linewidth(2));
triple bottomline(real t) {return region((t,1));}
path3 p = graph(bottomline,-1,1,operator ..);
draw(p,colorone+linewidth(2));

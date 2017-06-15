include apexconfig;

//ASY file for fig:surf_rev_intro in Chapter 10 sec:space_coord

size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,5,2);

// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={-2,2};
real[] myzchoice={-2,2};

pair xbounds=(-0.25,4.5);
pair ybounds=(-2.3,2.3);
pair zbounds=(-2.3,2.3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the curve y=sqrt(x)
triple g(real t) {return (t,sqrt(t),0);}
path3 mypath=graph(g,0,5,operator ..);
draw(mypath,colorone);

//Draw the revolved surface y^2 + z^2 = x
triple f(pair t) {return (t.x,sqrt(t.x)*cos(t.y),sqrt(t.x)*sin(t.y));}
surface s=surface(f,(0,0),(5,2*pi),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

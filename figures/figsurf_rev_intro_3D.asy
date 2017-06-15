include apexconfig;

//ASY file for fig:surf_rev_intro in Chapter 10 sec:space_coord

size(200,200,IgnoreAspect);
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

draw(circle((1,0,0),1,X),colortwo);
draw(circle((4,0,0),2,X),colortwo);

//Draw the x=1 plane with no spline
triple f(pair t) {return (1,t.x,t.y);}
surface s=surface(f,(-1.25,-1.25),(1.25,1.25));
draw(s,emissive(coloronefill));

//Draw the x=4 plane with no spline
triple f(pair t) {return (4,t.x,t.y);}
surface s=surface(f,(-2.25,-2.25),(2.25,2.25));
draw(s,emissive(coloronefill));

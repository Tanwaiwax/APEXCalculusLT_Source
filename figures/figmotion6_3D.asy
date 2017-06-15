include apexconfig;

//ASY file for figmotion63D.asy in Chapter 11 section sec:vvf_motion

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(5.6,10.7,4);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={2,4};
real[] myzchoice={-1,1};

pair xbounds=(-3,3);
pair ybounds=(-1,5);
pair zbounds=(-1.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the curve <t,t^2,sin(pi*t)> for t from -2 to 2
triple g(real t) {return (t,t^2,sin(pi*t));}
draw(graph(g,-2,2,operator ..),colorone);
draw(graph(g,-2,-1.2,operator ..),colorone,Arrow3(size=5mm));
//draw(graph(g,-2,-0.4,operator ..),colorone,Arrow3(size=5mm));
//draw(graph(g,-2,0.8,operator ..),colorone,Arrow3(size=5mm));
//draw(graph(g,-2,1.6,operator ..),colorone,Arrow3(size=5mm));

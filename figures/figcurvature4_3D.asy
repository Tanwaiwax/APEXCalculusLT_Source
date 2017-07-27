include apexconfig;

//ASY file for fig:curvature4 in Chapter 11 sec:curvature

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-2,2);
pair ybounds=(-1,2);
pair zbounds=(-2,2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the curve <t, t^2, 2*t^3> for t from -1 to 1
triple g(real t) {return (t, t^2, 2*t^3);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colorone);
path3 mypath=graph(g,-1,-0.7,operator ..);
draw(mypath,colorone,Arrow3(size=4mm));

//Draw points of maximum curvature at t=+/-0.189
dotfactor=4;
dot(g(0.189),colortwo);
dot(g(-0.189),colortwo);

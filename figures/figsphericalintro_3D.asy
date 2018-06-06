include apexconfig;

//ASY file for fig:sphericalintro in Section 13.7

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(24,17,11.6);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-.1,1.1);
pair ybounds=(-.1,1.1);
pair zbounds=(-.1,1.1);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

draw((.5,sqrt(3)/2,1)--(.5,sqrt(3)/2,0)--(0,0,0)--cycle,dashed);

draw(arc((0,0,0),(.5,0,0),(.25,sqrt(3)/4,0)),Arrow3(size=2mm));

draw(arc((0,0,0),(0,0,0.5),(.5,sqrt(3)/2,1)*.5/1.414),Arrow3(size=2mm));

guide3 myarc=arc((0,0,0),(0,0,0.5),(.5,sqrt(3)/2,1)*.5/1.414);

label("$\varphi$",myarc,NE);

dot((.5,sqrt(3)/2,1),colorone);

label("$\theta$",(.55*cos(pi/6),.55*sin(pi/6),.1));

label("$(\rho,\theta,\varphi)$",(.5,sqrt(3)/2,1.1));

label("$\rho$",(.5,sqrt(3)/2,1)*.5+(0.05,0.05,-.05));

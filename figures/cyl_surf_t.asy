include apexconfig;

// ASY file for fig:cylcoordsurf and fig:sphcoordsurf in 10_Other_Systems

currentprojection=orthographic((18,3,7),Z,O,1,(0,0));
size(200,200,IgnoreAspect);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-1.5,1.5);
pair ybounds=(-1.5,1.5);
pair zbounds=(-1.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y,0,0),E);
label("$y$",(0,ybounds.y,0),N);
label("$z$",(0,0,zbounds.y),W);

path3 planeoutline = (0,0,-1)--(1,1,-1)--(1,1,1)--(0,0,1)--cycle;
draw(planeoutline,colorone);
draw(surface(planeoutline),emissive(coloronefill));

draw(O--(1,1,0),black+dashed);
draw((.7,0,0)..(.7,.3,0)..(.5,.5,0),black+dashed);
label("$\theta_0$",(.7,0,0),SE);
label("$0$",O,NE);

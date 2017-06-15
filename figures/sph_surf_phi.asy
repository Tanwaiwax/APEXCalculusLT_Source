include apexconfig;

// ASY file for fig:cylcoordsurf in 10_Other_Systems

currentprojection=orthographic((18,3,7),Z,O,1,(0,0));
size(200,200,IgnoreAspect);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-1.5,1.5);
pair ybounds=(-1.5,1.5);
pair zbounds=(-.5,2.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y,0,0),E);
label("$y$",(0,ybounds.y,0),N);
label("$z$",(0,0,zbounds.y),W);

draw(circle(2*Z,1,Z),colorone);
draw(scale(1,1,2)*shift(Z)*rotate(180,Y)*unitcone,emissive(coloronefill));
draw((0,-1,2)--(0,1,2),black+dashed);
draw((0,0,1.118)..(0,.236,1.118)..(0,.5,1),black+dashed);
label("$\phi_0$",(0,.236,1.118),N);
label("$0$",O,SE);

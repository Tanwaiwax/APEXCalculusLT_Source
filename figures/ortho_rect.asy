include apexconfig;

// ASY file for fig_cart_coord in 10_Other_Systems

currentprojection=orthographic((18,3,7),Z,O,1,(0,0));
size(200,200,IgnoreAspect);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(0,1.2);
pair ybounds=(0,1.2);
pair zbounds=(0,1.3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y,0,0),E);
label("$y$",(0,ybounds.y,0),N);
label("$z$",(0,0,zbounds.y),W);

// other labels
label("$x$",.5X,W);
label("$y$",X+.5Y,S);
label("$z$",X+Y+.6Z,W);
label("$0$",O,W);
label("$(x,y,z)$",X+Y+Z,W);
label("$(x,y,0)$",X+Y,E);

// right angles
draw((.9,0,0)--(.9,.1,0)--(1,.1,0),black);
draw((1,.9,0)--(1,.9,.1)--(1,1,.1),black);

  
draw(X--X+Y,colorone);
draw(O--X+Y,black+dashed);
draw(X+Y--X+Y+Z,colorone);

draw((1,1,1)--(1.2,1,1),colorone+.4mm,Arrow3);
label("$\vec e_x$",(1.2,1,1),E);
draw((1,1,1)--(1,1.2,1),colorone+.4mm,Arrow3);
label("$\vec e_y$",(1,1.2,1),E);
draw((1,1,1)--(1,1,1.2),colorone+.4mm,Arrow3);
label("$\vec e_z$",(1,1,1.2),N);

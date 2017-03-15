include apexconfig;

// ASY file for fig:on_cyl_sph in 14_Div_Grad_Curl

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
label("$\theta$",(.2,.05,0));
label("$\phi$",(.2,.2,.5));
label("$\rho$",(.5,.5,.5),S);
label("$(x,y,z)$",X+Y+Z,W);
label("$(x,y,0)$",X+Y,E);

// right angles
draw((.9,0,0)--(.9,.1,0)--(1,.1,0),black);
draw((.9,.9,0)--(.9,.9,.1)--(1,1,.1),black);

  
draw(X--X+Y,black+dashed);
draw(O--X+Y,black+dashed);
draw(X+Y--X+Y+Z,black+dashed);
draw(O--X+Y+Z,black);

// arc for theta
draw((.4,0,0)..(.4,.15,0)..(.3,.3,0),black);
// arc for phi
draw((0,0,.4)..(.15,.15,.4)..(.3,.3,.3),black);
  
draw((1,1,1)--(1.2,1.2,1.2),colorone+.4mm,Arrow3);
label("$\vec e_\rho$",(1.2,1.2,1.2),N);
draw((1,1,1)--(1.1,1.1,.8),colorone+.4mm,Arrow3);
label("$\vec e_\phi$",(1.1,1.1,.8),E);
draw((1,1,1)--(.8,1.2,1),colorone+.4mm,Arrow3);
label("$\vec e_\theta$",(.8,1.2,1),E);


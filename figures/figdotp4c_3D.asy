include apexconfig;

//ASY file for fig:dotp4 in Chapter 10 sec:dot_product

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);

// The text calls for two viewpoints of this picture to show orthogonality
// The two projections below give those two views
//  view "b", saved as figdotp4b_3D
//currentprojection=orthographic(8,2,5);

//  view "c", saved as figdotp4c_3D
currentprojection=orthographic(2,8,6);

// setup and draw the axes
real[] myxchoice={2};
real[] myychoice={2};
real[] myzchoice={2};

pair xbounds=(-0.5,2.5);
pair ybounds=(-1,2.5);
pair zbounds=(-0.5,3);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

// Draw the lines for vec{x}=<1,1,1>
draw((0,0,0)--(0,1,0)--(1,1,0)--(1,0,0)--cycle, dashed+linewidth(.5));//bottom 
draw((1,1,0)--(1,1,1), dashed+linewidth(.5));//up3 
draw((0,0,0)--(1,1,1),colorone, Arrow3(size=3mm));
label("$\vec{x}$",(1,1,1),N);

// Draw the lines for projection of w onto x as <2,2,2>
// we start from the head of x so that it doesn't end up purple
draw((0,0,0)--(0,2,0)--(2,2,0)--(2,0,0)--cycle, dashed+linewidth(.5));//bottom 
draw((2,2,0)--(2,2,2), dashed+linewidth(.5));//up3 
draw((1,1,1)--(2,2,2), colortwo,Arrow3(size=3mm));
label("$\textrm{proj}_{\vec{x}} \vec{w}$",(2,2,2),N);

// Draw the lines for \vec{w}=<2,1,3>
draw((0,0,0)--(0,1,0)--(2,1,0)--(2,0,0)--cycle, dashed+linewidth(.5));//bottom 
draw((2,1,0)--(2,1,3), dashed+linewidth(.5));//up3 
draw((0,0,0)--(2,1,3),colorone, Arrow3(size=3mm));
label("$\vec{w}$",(2,1,3),N);

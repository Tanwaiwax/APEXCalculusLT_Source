include apexconfig;

//ASY file for 13_06_exset_02 in Chapter 13 sec:triple_int

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={1,2};
real[] myychoice={};
real[] myzchoice={1,2};

pair xbounds=(-0.5,2.5);
pair ybounds=(-2.5,0.5);
pair zbounds=(-0.5,2.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//edges of plane
draw((0,0,0)--(2,0,0)--(2,-2,2)--(0,-2,2)--cycle,colorone+linewidth(2));

//shade plane
path3 p=(0,0,0)--(2,0,0)--(2,-2,2)--(0,-2,2);
draw(surface(p -- cycle), emissive(coloronefill));

//edges of parabolic cylinder
triple g(real t) {return (2,t,0.5*t^2);}
path3 mypath=graph(g,-2,0,operator ..);
draw(mypath,colortwo+linewidth(2));
triple g(real t) {return (0,t,0.5*t^2);}
path3 mypath=graph(g,-2,0,operator ..);
draw(mypath,colortwo+linewidth(2));

triple cylin(pair t) {return (t.x,t.y,.5*t.y^2);}
surface surf = surface(cylin,(0,-2),(2,0));
draw(surf,emissive(colortwofill),colortwo);

/*
//Shade the cylinder
int k=10;
for (int i=0; i<2*k; ++i)
{
path3 p=(2,-i/k,0.5*(i/k)^2)--(2,-(i+1)/k,0.5*((i+1)/k)^2)--(0,-(i+1)/k,0.5*((i+1)/k)^2)--(0,-i/k,0.5*(i/k)^2);
draw(surface(p -- cycle), emissive(rgb(1,.6,.6)+opacity(0.7)));
}
*/

//labels and arrow
label("$z=-y$",(.5,0.5,2),E);draw((.5,.75,1.8)--(.75,-1,1),Arrow3(size=2mm));
label("$z=\frac{1}{2}y^2$",(2.25,-1.5,.75),W);
draw((2.25,-1.5,.7)--(2,-0.85,.32),Arrow3(size=2mm));

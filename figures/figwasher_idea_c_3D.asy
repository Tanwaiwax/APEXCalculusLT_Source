include apexconfig;

//ASY file for fig:washeridea in Chapter 7 section sec:disk

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((10.17,5.3,46),(0,1,0),(0,0,0),1,(-0.0999,0.0072));

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-.2,3.5);
pair ybounds=(-3.5,3.5);
pair zbounds=(-3.5,3.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple g1(real t) {return (t,((t-2)^2+1),0);}
path3 p1=graph(g1,1,3,operator ..);
draw(p1,colortwo+.4mm);

triple g2(real t) {return (t,(-.5*(t-2)^2+3),0);}
path3 p2=graph(g2,3,1,operator ..);
draw(p2,colorone+.4mm);

draw(surface(p1--p2--cycle), emissive(coloronefill));

draw((-.2,.5,0)--(3.5,.5,0),dashed+.2mm);

draw((1,0,0)--(1,-.1,0));
draw((3,0,0)--(3,-.1,0));
label("$a$",(1,-.1,0),S);
label("$b$",(3,-.1,0),S);

triple dot1=(1.2,2.68,0);
triple dot2=(1.2,.5,0);
triple dot3=(2.8,1.64,0);
triple dot4=(2.8,.5,0);

draw(dot1--dot2,black+.2mm);
draw(dot3--dot4,black+.2mm);

dotfactor=2;
dot(dot1);
dot(dot2);
dot(dot3);
dot(dot4);

label("$R(x)$",dot2+.3*(dot1-dot2),W);
label("$r(x)$",dot4+.4*(dot3-dot4),E);

triple f2(pair t) {return (2,cos(t.x)*t.y+.5,sin(t.x)*t.y);}
surface s2=surface(f2,(0,.5),(2*pi,2.5),16,1,Spline);
draw(s2,emissive(colortwofill));

triple g3(real t) {return (2,.5*cos(t)+.5,.5*sin(t));}
path3 p3=graph(g3,0,2*pi,operator ..);
draw(p3,colortwo+.4mm);

triple g3(real t) {return (2,2.5*cos(t)+.5,2.5*sin(t));}
path3 p3=graph(g3,0,2*pi,operator ..);
draw(p3,colorone+.4mm);

draw((2,1,0)--(2,3,0),.5*colorone+.5*colortwo+dashed+.3mm);

include apexconfig;

//ASY file for fig:direct2 in Chapter 12 sec:directional_derivative

size(200,200,IgnoreAspect);

// for the default version, figdirect2
currentprojection=orthographic(12,13,3);

// for the second, zoomed in view, figdirect2b
//currentprojection=orthographic((5.6,16.3,2.6),(0,0,1),(0,0,0),1.6,(-0.03,-0.34));

// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={2,4};
real[] myzchoice={-1,1};

pair xbounds=(-1,6);
pair ybounds=(-1,5);
pair zbounds=(-1.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=sin(x)*cos(y)
triple f(pair t) {
  return (t.x,t.y,sin(t.x)*cos(t.y));
}
surface s=surface(f,(-1.5,-1.5),(4,4),8,8,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//plot point on surface
dotfactor=3;
dot(f((pi/3,pi/3)));

//Draw the vectors on the surface 
draw(f((pi/3,pi/3))--f((pi/3,pi/3))+(3/sqrt(10),1/sqrt(10),0),Arrow3(size=2mm));//T at point
draw(f((pi/3,pi/3))--f((pi/3,pi/3))+(1/sqrt(10),-3/sqrt(10),0),linetype(new real[] {2,2}),Arrow3(size=2mm));//N at point
draw(f((pi/3,pi/3))--f((pi/3,pi/3))+(1/sqrt(10),-3/sqrt(10),0.79),Arrow3(size=2mm));//tangent

//plot level curve
draw(f((0.4485,0))..f((0.4693,0.2857))..f((0.5417,0.5714))..f((0.7143,0.8481))..f((0.9331,1.))..f((1.143,1.075))..f((1.429,1.118))..f((1.714,1.118))..f((2.,1.074))..f((2.209,1.))..f((2.429,0.8467))..f((2.6,0.5714))..f((2.673,0.2857))..f((2.694,0))..f((2.673,-0.2857))..f((2.615,-0.5276))..f((2.531,-0.7143))..f((2.347,-0.9187))..f((2.098,-1.044))..f((1.821,-1.107))..f((1.551,-1.122))..f((1.237,-1.094))..f((0.9783,-1.022))..f((0.7185,-0.8529))..f((0.5714,-0.639))..f((0.4838,-0.3734))..f((0.4517,-0.1197))..f((0.4485,-0.01989)),colorone+linewidth(2));

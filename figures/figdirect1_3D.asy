include apexconfig;

//ASY file for fig:direct1 in Chapter 12 sec:directional_derivative

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(16,5,25);

// setup and draw the axes
real[] myxchoice={4};
real[] myychoice={4};
real[] myzchoice={10};

pair xbounds=(-0.5,4.75);
pair ybounds=(-0.5,4.75);
pair zbounds=(0,15);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=14-x^2-y^2
triple f(pair t) {
  return (t.x,t.y,14-t.x^2-t.y^2);
}
surface s=surface(f,(0,0),(2,2.5),6,5,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//plot point P and on curve and point Q
dotfactor=3;dot((1,2,9));
dot((1,2,0));
label("$P$",(1,2,0),N);
dot((3,4,0));
label("$Q$",(3,4,0),N);

//draw grid lines
for ( int n = 1 ; n <= 4 ; ++n ) {
  draw((0,n,0)--(4.5,n,0),gray+linewidth(.5));
  draw((n,0,0)--(n,4.5,0),gray+linewidth(.5));
}

//Draw the vectors in the plane from P
draw((1,2,0)--(1.707,2.707,0),Arrow3(size=2mm));//P to u1
label("$\vec{u}_1$",(1.707,2.707,0),E);//u1
draw((1,2,0)--(1.894,1.553,0),Arrow3(size=2mm));//P to u2
label("$\vec{u}_2$",(1.894,1.553,0),S);//u2
draw((1,2,0)--(0.552,1.106,0),Arrow3(size=2mm));//P to u3
label("$\vec{u}_3$",(0.552,1.106,0),W);//u3


//Draw the vectors on the surface above P
draw((1,2,9)--(1.707,2.707,4.76),Arrow3(size=2mm));//P to u1
draw((1,2,9)--(1.894,1.553,9),Arrow3(size=2mm));//P to u2
draw((1,2,9)--(0.552,1.106,13.47),Arrow3(size=2mm));//P to u3

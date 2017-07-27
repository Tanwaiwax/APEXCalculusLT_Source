include apexconfig;

//ASY file for fig:mchain2 in Chapter 12 sec:multi_chain

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(6.5,3.4,1.9);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-1,1};
real[] myzchoice={1,2,3};

pair xbounds=(-1.5,1.5);
pair ybounds=(-1.5,1.5);
pair zbounds=(0,4);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x,t.y,t.x^2+t.y^2-t.x*t.y);
}
surface s=surface(f,(-1.1,-1.1),(1.1,1.1),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw the circle on surface
triple g(real t) {
  return (cos(t),
  	  sin(t),
	  (cos(t))^2+(sin(t))^2-cos(t)*sin(t));
}
path3 mypath=graph(g,0,2*pi,operator ..);
draw(mypath,colorone);

//plot points for min and max along the curve
dotfactor=3;
dot((cos(pi/4),sin(pi/4),1-cos(pi/4)*sin(pi/4)));
dot((cos(5*pi/4),sin(5*pi/4),1-cos(5*pi/4)*sin(5*pi/4)));
dot((cos(3*pi/4),sin(3*pi/4),1-cos(3*pi/4)*sin(3*pi/4)));
dot((cos(7*pi/4),sin(7*pi/4),1-cos(7*pi/4)*sin(7*pi/4)));

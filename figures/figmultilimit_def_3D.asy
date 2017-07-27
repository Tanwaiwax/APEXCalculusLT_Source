include apexconfig;

//ASY file for fig:multilimitdef in Chapter 12 sec:multi_limit

size(200,200,IgnoreAspect);
currentprojection=orthographic(7,-2,3);
//currentprojection=orthographic((10.3,-3.3,2.4),(-0.004,0.001,0.016),(0,0,0),1,(0,0));

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-0.1,1);
pair ybounds=(-0.1,1);
pair zbounds=(-0.1,3.5);
//pair xbounds=(-0.5,3);
//pair ybounds=(-0.5,3);
//pair zbounds=(-0.1,2.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(pair t) {
  return (t.x*cos(t.y),t.x*sin(t.y),3-2*t.x^2);
//  return (sqrt(4*(2-t.y))*cos(t.x),sqrt(4*(2-t.y))*sin(t.x),t.y);
}
surface s=surface(f,(0,0),(1,pi/2),10,10,Spline);
//surface s=surface(f,(0,0.75),(pi/2,2),10,10,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//draw the dot on the surface and in the xy-plane
dotfactor=3;
dot((.5,.5,2));
dot((.5,.5,0));

draw(circle((.5,.5,0),.25,Z),linetype(new real[] {4,4})+colorone+linewidth(1.5));
//draw(circle((1,1,0),.24,Z),linetype(new real[] {4,4})+colorone+linewidth(1.5));
draw((.5,.5,0)--(.5,.25,0),colorone);
label("$\delta$",(.5,.37,0),S);
label("$c=(x_0,y_0)$",(.8,.8,0),SE);
draw((.8,.8,0)--(.55,.55,0),linewidth(.75),Arrow3(size=3mm));

//draw the dashed circle on the surface with label
triple g(real t) {
       return (.5+.25*cos(t),
               .5+.25*sin(t),
	       3-2*((.5+.25*cos(t))^2+(.5+.25*sin(t))^2));
//	       2-((1+.24*cos(t))^2)/4-((1+.24*sin(t))^2)/4);
}
path3 mypath=graph(g,0,2*pi,operator ..); 
draw(mypath,linetype(new real[] {4,4})+colorone+linewidth(1.5));
label("$(x_0,y_0,L)$",(.8,.8,2.5),NE);
draw((.8,.8,2.5)--(.55,.55,2.05),linewidth(0.75),Arrow3(size=3mm));

draw((0,-.1,2)--(0,0,2));
label("$L$",(0,-.1,2),W);

draw((0,-.1,2.9)--(0,0,2.9));
label("$L+\epsilon$",(0,-.1,2.9),W);
draw((0,-.1,1.1)--(0,0,1.1));
label("$L-\epsilon$",(0,-.1,1.1),W);

include apexconfig;

//ASY file for fig:doublepol5 in Chapter 12 sec:double_int_polar

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(13,-8,1.8);

// setup and draw the axes
real[] myxchoice={2,4};
real[] myychoice={2,4};
real[] myzchoice={0.5,1};

pair xbounds=(0,5.5);
pair ybounds=(0,5.5);
pair zbounds=(0,1.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface
triple f(pair t) {
  return (t.x,t.y,1/(1+t.x^2+t.y^2));
}
surface s=surface(f,(-0.25,-0.25),(5,5),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//draw curves on xy plane
triple g(real t) {return (2.5*cos(t),2.5*sin(t),0);}
path3 mypath=graph(g,0,pi/2,operator ..);
draw(mypath,colorone+dashed+linewidth(0.75));
label("$a$",(2.7,-0.2,0),S);

//draw curves on surface
triple g(real t) {return (2.5*cos(t),2.5*sin(t),1/(1+2.5^2));}
path3 mypath=graph(g,0,pi/2,operator ..);
draw(mypath,colorone+linewidth(2));
triple g(real t) {return (t,0,1/(1+t^2));}
path3 mypath=graph(g,0,2.5,operator ..);
draw(mypath,colorone+linewidth(2));
triple g(real t) {return (0,t,1/(1+t^2));}
path3 mypath=graph(g,0,2.5,operator ..);
draw(mypath,colorone+linewidth(2));

//draw connecting lines
draw((2.5,0,0) -- (2.5,0,1/(1+2.5^2)),colorone+dashed+linewidth(0.75));
draw((0,2.5,0) -- (0,2.5,1/(1+2.5^2)),colorone+dashed+linewidth(0.75));

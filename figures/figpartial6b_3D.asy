include apexconfig;

//ASY file for fig:partial7 in Chapter 12 sec:partial_derivatives
// yes the file name disagrees

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(2.5,8.4,3.);

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-1,1};
real[] myzchoice={-1,1};

pair xbounds=(-1.5,1.5);
pair ybounds=(-1.5,1.5);
pair zbounds=(-2,2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw surface z=x^2-y^2+xy
triple f(pair t) {
  return (t.x,t.y,t.x^2-t.y^2+t.x*t.y);
}
surface s=surface(f,(-1,-1),(1,1),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw the point (-0.5,0.5,-0.25) and trace for y=0.5
dotfactor=3;
dot((-0.5,0.5,-0.25));
triple g(real t) {return (t,0.5,t^2-0.25+0.5*t);}
path3 mypath=graph(g,-1,1,operator ..);
draw(mypath,colortwo);

//Draw the tangent lines in y direction, slope -1.5 
//  L=(-0.5,0.5,-0.25)+t(0,1,-1.5) for t=-1,1
draw((-0.5,-0.3,.95)--(-0.5,1.3,-1.45),colorone);

//Draw the tangent lines in y direction, slope -1.75 and dot
//  L=(-0.75,0.5,-0.0625)+t(0,1,-1.75) for t=-1,1
dot((-0.75,0.5,-0.0625));
draw((-0.75, -0.3, 1.3375)--(-0.75, 1.3, -1.4625),dashed+colorone);

//Draw the tangent lines in y direction, slope -1.25 and dot
//  L=(-0.25,0.5,-0.3125)+t(0,1,-1.25) for t=-1,1
dot((-0.25,0.5,-0.3125));
draw((-0.25, -0.3, 0.6875)--(-0.25, 1.3, -1.3125),dashed+colorone);

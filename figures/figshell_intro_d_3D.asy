include apexconfig;

//ASY file for fig:shell_intro in Chapter 7 section sec:shell_method

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((13.6,14.55,43),(0,1,0),(0,0,0),1,(0,0));

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={1};
real[] myzchoice={};

pair xbounds=(-1.2,1.2);
pair ybounds=(-.2,1.2);
pair zbounds=(-1.2,1.2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple g1(real t) {return (t,1/(1+t^2),0);}
path3 p1=graph(g1,0,1,operator ..);
draw(p1--(1,0,0),colorone+.4mm);
//draw(surface(p1 -- (1,0,0)--(0,0,0)--cycle), emissive(coloronefill));

pen p=colorone;
pen q=colortwo+.1mm;

triple f(pair t) {return (cos(t.x),t.y,sin(t.x));}
surface s=surface(f,(0,0),(2*pi,.5),8,2,Spline);
//draw(s,coloronefill,meshpen=p);

triple f(pair t) {return (cos(t.x)*t.y,1/(1+t.y^2),t.y*sin(t.x));}
surface s=surface(f,(0,0),(2*pi,1),8,16,Spline);
//draw(s,coloronefill,meshpen=p);

path3 p2=(.6,0,0)--(.7,0,0)--(.7,.7,0)--(.6,.7,0)--cycle;
//draw(surface(p2),emissive(colortwofill));
draw(p2,colortwo+.4mm);

triple f(pair t) {return (.6*cos(t.x),t.y,.6*sin(t.x));}
surface s=surface(f,(0,0),(2*pi,.7),8,2,Spline);
draw(s,emissive(colortwofill),meshpen=q);

triple f(pair t) {return (.7*cos(t.x),t.y,.7*sin(t.x));}
surface s=surface(f,(0,0),(2*pi,.7),8,2,Spline);
draw(s,emissive(colortwofill),meshpen=q);

draw(circle((0,.7,0),.6,Y),colortwo+.3mm);
draw(circle((0,.7,0),.7,Y),colortwo+.3mm);
draw(circle((0,0,0),.6,Y),colortwo+.3mm);
draw(circle((0,0,0),.7,Y),colortwo+.3mm);

triple f(pair t) {return (t.y*cos(t.x),.7,t.y*sin(t.x));}
surface s=surface(f,(0,.6),(2*pi,.7),8,1,Spline);
draw(s,emissive(colortwofill),meshpen=q);

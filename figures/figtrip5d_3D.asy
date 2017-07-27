include apexconfig;

//ASY file for fig:trip5b in Chapter 13 sec:triple_int

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(8.4,6.8,12.6);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={2,4,6};

pair xbounds=(-2.5,2.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-0.5,7);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//curves in xy plane
triple topline(real t) {return (0,t,6-t^2);}
path3 toppath = graph(topline,-2,2,operator ..);
triple midline(real t) {return (0,t,4-t^2/2);}
path3 midpath = graph(midline,-2,2,operator ..);
triple botline(real t) {return (0,t,2);}
path3 bottompath = graph(botline,-2,2);
draw(toppath,colorone+linewidth(2));
draw(midpath,colorone+linewidth(2));
draw(bottompath,colorone+linewidth(2));

// todo find a better way to shade this in
triple topregion(pair t) { return t.x*topline(t.y)+(1-t.x)*midline(t.y);}
surface topsurf = surface(topregion,(0,-2),(1,2));
draw(topsurf,emissive(coloronefill),colorone);
triple botregion(pair t) { return t.x*midline(t.y)+(1-t.x)*botline(t.y);}
surface botsurf = surface(botregion,(0,-2),(1,2));
draw(botsurf,emissive(colortwofill),colortwo);

//labels
label("$R_1$",(0.1,.5,3));
label("$R_2$",(0.1,.5,5));
label("$z=4-y^2/2$",(0,-1.5,5.5));
label("$z=6-y^2$",(0,2,6));
draw((0.2,-1.5,5.3)--(0,-1,3.55),Arrow3(size=2mm));
draw((0.2,2,5.7)--(0,1,5.05),Arrow3(size=2mm));

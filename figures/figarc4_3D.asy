include apexconfig;

//ASY file for fig:surface_intro in 07_Arc_Length

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((16.7,13.2,46),(0,1,0),(0,0,0),1,(-.0323,0.0012));
//currentprojection=orthographic((16.7,13.2,46),(0,1,0),(0,0,0),1,(0.0148,0.00673));


// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-.25,2.1);
pair ybounds=(-1.1,1.1);
pair zbounds=(-1.1,1.1);

xaxis3("",xbounds.x,xbounds.y,black,Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f2(pair t) {return (t.x,(.41*(t.x-.9)+.78)*sin(t.y),(.41*(t.x-.9)+.78)*cos(t.y));}
surface s2=surface(f2,(.9,0),(1.4,2*pi),2,16,Spline);
draw(s2,emissive(coloronefill),meshpen=colorone);

triple g3(real t) {return (t,sin(t),0);}
path3 p3=graph(g3,.5,1.9,operator ..);
draw(p3,colorone+.4mm);

draw(circle((.9,0,0),.78,X),colorone+.2mm);
draw(circle((1.4,0,0),.985,X),colorone+.2mm);
draw((.9,.78,0)--(1.4,.985,0),colortwo+.6mm);

draw((.5,.05,0)--(.5,-.05,0),black+.2mm);
label("$a$",(.5,-.05,0),S);
//xtick("$a$",.5,black+.2mm); // doesn't work? ignores all other commands

draw((1.9,.05,0)--(1.9,-.05,0),black+.2mm);
label("$b$",(1.9,-.05,0),S);

draw((.9,.05,0)--(.9,-.05,0),black+.2mm);
label("$x_{i-1}$",(.9,-.05,0),S);

draw((1.4,.05,0)--(1.4,-.05,0),black+.2mm);
label("$x_i$",(1.4,-.05,0),S);

label(XY*"$\left.\rule{0pt}{40pt}\right\}\ R_2$",(1.4,.49,0),E,Embedded);
label(XY*"$R_1\left\{\rule{0pt}{30pt}\right.$",(.85,.37,0),W,Embedded);
label(rotate(20,(0,0,1))*"$\overbrace{\rule{41pt}{0pt}}^{\displaystyle L}$",(1.1,1.03,0),Embedded);

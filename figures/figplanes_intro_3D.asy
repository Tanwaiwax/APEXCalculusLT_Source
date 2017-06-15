include apexconfig;

//ASY file for fig:planes_intro in Chapter 10 section sec:planes

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((-4,27,7),(.012,-0.002,0.015),(0,0,0),.9);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-2,2);
pair ybounds=(-2,2);
pair zbounds=(-2,2);

xaxis3("",xbounds.x,xbounds.y,invisible,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,invisible,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

real f(pair z) {return 0;}
surface s=surface(f,(-2,-2),(2,2),1,1);
//pen p=colorone+.3mm;
draw(s,emissive(coloronefill),meshpen=colorone,render(merge=true));

draw(scale(.1,.1,.2)*rotate(180,Y)*shift(-1Z)*unitcone,surfacepen=white);
draw(scale(.1,.1,.5)*shift(.4Z)*unitcylinder,surfacepen=white);
draw(scale(.15,.15,.05)*shift(14Z)*unitcylinder,surfacepen=white);

draw(scale3(.15)*shift(4.7Z)*unitdisk,surfacepen=white);
draw(scale3(.15)*shift(5Z)*unitdisk,surfacepen=white);

draw(scale3(.05)*unitdisk);
label("$P$",(0,0,0),NW);

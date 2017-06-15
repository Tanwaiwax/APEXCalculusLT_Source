include apexconfig;

//ASY file for fig:planes_dist in Chapter 10 section sec:planes

size(200,200,Aspect);
//size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4.5,4.5,1.5);

// setup and draw the axes
real[] myxchoice={-4,4};
real[] myychoice={-4,4};
real[] myzchoice={2};

pair xbounds=(-5,5);
pair ybounds=(-5,5);
pair zbounds=(-5,5);

//Draw the plane xy-plane
triple f(pair t) {return (t.x,t.y,0);}
surface s=surface(f,(-2,-1),(2,1.5),1,1,Spline);
draw(s,emissive(coloronefill),meshpen=colorone+thick(),render(merge=true));

dotfactor=3;
dot((0,0,0),black);
dot((0,1,0),black);
label("$P$",(0,1,0),E);

//Draw the normal at P
draw((0,1,0)--(0,1,1),colorone+linewidth(.75),Arrow3(size=2mm));
label("$\vec{n}$",(0,1,1),E);

//Draw the dashed line from origin to Q=(0,0,2) with label h
draw((0,0,0)--(0,0,2),colorone+dashed+linewidth(.75));
dot((0,0,2),black);
label("$Q$",(0,0,2),W);
label("$h$",(0,0,1),W);

//Draw the vector PQ stopping just short of Q
draw((0,1,0)--(0,.05,1.95),colorone+linewidth(.75),Arrow3(size=2mm));
//label("$\vec{n}$",(0,1,1),E);

//Draw the perpendicular symbol as two small lines
draw((0,0,0.2)--(0,0.2,0.2),linewidth(.75));
draw((0,0.2,0)--(0,0.2,0.2),linewidth(.75));

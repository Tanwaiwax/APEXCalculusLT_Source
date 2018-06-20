include apexconfig;

//ASY file for fig:planes1 in Chapter 10 section sec:planes

//size(200,200,IgnoreAspect);
size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((1.92,19.3,4),(0,-0.015,0.06),(0,0,0),1);

// setup and draw the axes
real[] myxchoice={-4,4};
real[] myychoice={-4,4};
real[] myzchoice={-4,4};

pair xbounds=(-3.5,3.5);
pair ybounds=(-4.5,4.5);
pair zbounds=(-4.5,6.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0),S);
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the plane
triple f(pair t) {return (t.x,t.y,-2*t.x-t.y+3);}
surface s=surface(f,(-1,-2),(2,3),8,8,Spline);
draw(s,emissive(coloronefill),meshpen=colorone,render(merge=true));

dotfactor=3;
dot((1,1,0));label("$P$",(1,1,0),N);
dot((1,2,-1));label("$Q$",(1,2,-1),W);
dot((0,1,2));label("$R$",(0,1,2),W);
//Draw Vectors
draw((1,1,0)--(1,2,-1),colorone,Arrow3(size=2mm));//PQ
draw((1,1,0)--(0,1,2),colorone,Arrow3(size=2mm));//PR
draw((1,1,0)--(3,2,1),colorone,Arrow3(size=2mm));//P to PQxPR
label("$\vv{PQ}\times \vv{PR}$",(3,2,1),N);

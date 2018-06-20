include apexconfig;

//ASY file for fig:planes2 in Chapter 10 section sec:planes

size(200,200,Aspect);
//size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((-16,18.6,6.76),(0.014,-0.015,0077),(0,0,0),.99);

// setup and draw the axes
real[] myxchoice={5};
real[] myychoice={5};
real[] myzchoice={-5};

pair xbounds=(-4,6);
pair ybounds=(-1,6);
pair zbounds=(-6,5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the plane
triple f(pair t) {return (t.x,t.y,(5/7)*t.x+(4/7)*t.y-1);}
surface s=surface(f,(-5,-6),(5,6),8,8,Spline);
draw(s,emissive(coloronefill),meshpen=colorone,render(merge=true));

dotfactor=3;
dot((-1,3,0));
label("$P$",(-1,3,0),E);

//Draw normal vector at P, n=(5,4,-7)
draw((-1,3,0)--(4,7,-7),black,Arrow3(size=2mm));//n at P
label("$\vec{n}$",(4,7,-7),W);

//draw the lines -5+2t,1+t,-4+2t  and 2+3t,1-2t,1+t
draw((5,6,6)--(-5,1,-4),colorone);
label("$\ell_1$",(5,6,6),N);//L1
draw((5,-1,2)--(-4.9,5.6,-1.3),colorone);
label("$\ell_2$",(5,-1,2),N);//L2

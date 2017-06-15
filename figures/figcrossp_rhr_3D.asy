include apexconfig;

//ASY file for fig:crossp_rhr in Chapter 10 section sec:cross_product

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-1.5,1.5);
pair ybounds=(-1.5,1.5);
pair zbounds=(-0.5,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));


//Draw theplane z=(-2*x+5*y)/27;
triple f(pair t) {
  return (t.x,t.y,(-2*t.x+5*t.y)/27);
}
surface s=surface(f,(-1.5,-1.5),(1.5,1.5),8,8,Spline);
draw(s,emissive(coloronefill),meshpen=colorone,render(merge=true));


// Draw vec{u}=<-1/5,1,1/5>
draw((0,0,0)--(-1/5,1,1/5), colorone,Arrow3(size=3mm));
label("$\vec{u}$",(-1/5,1,1/5),N);

// Draw  \vec{v}=<-6/5,3/5,1/5>
draw((0,0,0)--(-6/5,3/5,1/5), colorone,Arrow3(size=3mm));
label("$\vec{v}$",(-6/5,3/5,1/5),N);

// Draw the cross product of u and v <2,-5,27> but scale it as <2,-5,27>/25
draw((0,0,0)--(2/25,-5/25,27/25), colortwo,Arrow3(size=3mm));
label("$\vec{u} \times \vec{v}$",(2/25,-5/25,27/25),NW);

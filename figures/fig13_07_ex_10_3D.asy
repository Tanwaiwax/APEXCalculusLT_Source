include apexconfig;

//ASY file for Exercise 13.7#10

size(200,200,IgnoreAspect);
currentprojection=orthographic(16,3.9,8.1);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-.6,.6);
pair ybounds=(-.6,.6);
pair zbounds=(-.1,1);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

real t1=pi/3;
real t2=7pi/6;
real p1=pi/6-.2;
real p2=pi/6+.2;
real r1=.75;
real r2=.9;

triple f(pair t) {
	return (r1*cos(t.x)*sin(t.y),r1*sin(t.x)*sin(t.y),r1*cos(t.y));//
}
surface s=surface(f,(t1,p1),(t2,p2),4,4,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone+.1mm;
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (r2*cos(t.x)*sin(t.y),r2*sin(t.x)*sin(t.y),r2*cos(t.y));//
}
surface s=surface(f,(t1,p1),(t2,p2),4,4,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);


triple f(pair t) {
	return (t.y*cos(t.x)*sin(p1),t.y*sin(t.x)*sin(p1),t.y*cos(p1));//
}
surface s=surface(f,(t1,r1),(t2,r2),4,4,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);


triple f(pair t) {
	return (t.y*cos(t.x)*sin(p2),t.y*sin(t.x)*sin(p2),t.y*cos(p2));//
}
surface s=surface(f,(t1,r1),(t2,r2),4,4,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (t.y*cos(t1)*sin(t.x),t.y*sin(t1)*sin(t.x),t.y*cos(t.x));//
}
surface s=surface(f,(p1,r1),(p2,r2),4,4,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (t.y*cos(t2)*sin(t.x),t.y*sin(t2)*sin(t.x),t.y*cos(t.x));//
}
surface s=surface(f,(p1,r1),(p2,r2),4,4,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

// lines for phi
draw( (r1*cos(t1)*sin(p1),r1*sin(t1)*sin(p1),r1*cos(p1))
-- (0,0,0) -- (r1*cos(t1)*sin(p2),r1*sin(t1)*sin(p2),
r1*cos(p2)),black+.25mm+dashed);

//  lines for theta
draw( (0,0,0) -- (r1*cos(t1)*sin(p2),r1*sin(t1)*sin(p2),0),black+.25mm+dashed);

draw( (0,0,0) -- (r1*cos(t2)*sin(p2),r1*sin(t2)*sin(p2),0),black+.25mm+dashed);

draw( arc( (0,0,0),.25*(r1,0,0),
.5*(r1*cos(t1)*sin(p2),r1*sin(t1)*sin(p2),0)),
black+.25mm,Arrow3(size=1.5mm));

draw( arc( (0,0,0),.4*(r1,0,0),
.4*(r1*cos(t2)*sin(p2),r1*sin(t2)*sin(p2),0),(0,0,1)),
black+.25mm,Arrow3(size=1.5mm));

label("\scriptsize$\theta_1$",
.25*(r1*cos(t1/2)*sin(p2),r1*sin(t1/2)*sin(p2),0));
label("\scriptsize$\theta_2$",
.5*(r1*cos(t2/2)*sin(p2),r1*sin(t2/2)*sin(p2),0));

// lines for rho
draw(arc((0,0,0),(r1*cos(t1)*sin(0),r1*sin(t1)*sin(0),r1*cos(0)),(r1*cos(t1)*sin(p1),r1*sin(t1)*sin(p1),r1*cos(p1))),black+.25mm+dashed);

draw(arc((0,0,0),(r2*cos(t1)*sin(0),r2*sin(t1)*sin(0),r2*cos(0)),(r2*cos(t1)*sin(p1),r2*sin(t1)*sin(p1),r2*cos(p1))),black+.25mm+dashed);


label("\scriptsize$\rho_1$",(0,0,r1),W);
label("\scriptsize$\rho_2$",(0,0,r2),W);

// lines for phi length
draw( arc( (0,0,0),.9*(0,0,r1),
.95*(r1*cos(t1)*sin(p1),r1*sin(t1)*sin(p1),r1*cos(p1))),
black+.25mm,Arrows3(size=1.5mm));
label("\scriptsize$\varphi_1$",
.9*(r1*cos(t1)*sin(p1/2),r1*sin(t1)*sin(p1/2),r1*cos(p1/2)),S);


label("\scriptsize$\varphi_2$",.68*(r1*cos(t1)*sin(p1+(p2-p1)/2),
r1*sin(t1)*sin(p1+(p2-p1)/2),r1*cos(p1+(p2-p1)/2)),S);
draw( arc( (0,0,0), .7*(0,0,r1), .7*(r1*cos(t1)*sin(p2),r1*sin(t1)*sin(p2),r1*cos(p2)) ),
black+.25mm,Arrows3(size=1.5mm));

include apexconfig;

//ASY file for exercise 13.7#9

size(200,200,IgnoreAspect);
currentprojection=orthographic(16.5,4,4.8);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-1.1,1.1);
pair ybounds=(-1.1,1.1);
pair zbounds=(-.1,1.1);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

real r1=.4;
real r2=.6;
real t1=pi/6;
real t2=4pi/3;
real z1=.4;
real z2=.8;

triple f(pair t) {
	return (r1*cos(t.y),r1*sin(t.y),t.x);//
}
surface s=surface(f,(z1,t1),(z2,t2),4,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone+.1mm;
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (r2*cos(t.y),r2*sin(t.y),t.x);//
}
surface s=surface(f,(z1,t1),(z2,t2),4,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (t.x*cos(t1),t.x*sin(t1),t.y);//
}
surface s=surface(f,(r1,z1),(r2,z2),4,4,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (t.x*cos(t2),t.x*sin(t2),t.y);//
}
surface s=surface(f,(r1,z1),(r2,z2),4,4,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (t.x*cos(t.y),t.x*sin(t.y),z1);//
}
surface s=surface(f,(r1,t1),(r2,t2),4,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (t.x*cos(t.y),t.x*sin(t.y),z2);//
}
surface s=surface(f,(r1,t1),(r2,t2),4,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

draw((0,0,0) -- .8*(cos(t1),sin(t1),0),dashed+.25mm);
draw((0,0,0) -- .8*(cos(t2),sin(t2),0),dashed+.25mm);

draw(arc((0,0,0),.3*(1,0,0),.3*(cos(t2),sin(t2),0),(0,0,1)),
black+.25mm,Arrow3(size=2mm));
draw(arc((0,0,0),.5*(1,0,0),.3*(cos(t1),sin(t1),0),(0,0,1)),
black+.25mm,Arrow3(size=2mm));

label("\scriptsize$\theta_1$",.6(cos(t1/2),sin(t1/2),-.05));
label("\scriptsize$\theta_2$",.5(cos(t2/1.5),sin(t2/1.5),0));

draw ((r2*cos(t2),r2*sin(t2),z1) -- (r2*cos(t2),r2*sin(t2),0),dashed+.25mm);
draw ((r2*cos(t1),r2*sin(t1),z1) -- (r2*cos(t1),r2*sin(t1),0),dashed+.25mm);

draw ((0,0,z2) -- (r2*cos(t2/1.5),r2*sin(t2/1.5),z2),dashed+.25mm);
draw ((0,0,z2) -- (r1*cos(t2/3),r1*sin(t2/3),z2),dashed+.25mm);


label("\scriptsize$r_2$",(r2*.95*cos(t2/1.5),r2*.95*sin(t2/1.5),z2+.05));
label("\scriptsize$r_1$",(r1*.8*cos(t2/3),r1*.8*sin(t2/3),z2+.05));


draw((0,0,z1) -- (r1*cos(t1),r1*sin(t1),z1),dashed+.25mm);
draw((0,0,z2) -- (r1*cos(t1),r1*sin(t1),z2),dashed+.25mm);

label("\scriptsize$z_1$",(0,0,z1),W);
label("\scriptsize$z_2$",(0,0,z2),W);


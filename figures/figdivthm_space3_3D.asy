include apexconfig;

//ASY file for fig:divthm_space3 in sec:stokes_divergence

size(200,200,IgnoreAspect);
currentprojection=orthographic(30,20,12);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-1.2,1.2);
pair ybounds=(-1.2,1.2);
pair zbounds=(-1.2,1.2);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the faces of the cube 
pen p=colorone;

triple f(pair t) {
	return (t.x,t.y,1);//
}
surface s=surface(f,(-1,-1),(1,1),1,1,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (t.x,t.y,-1);//
}
surface s=surface(f,(-1,-1),(1,1),1,1,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (t.x,1,t.y);//
}
surface s=surface(f,(-1,-1),(1,1),1,1,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (t.x,-1,t.y);//
}
surface s=surface(f,(-1,-1),(1,1),1,1,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (1,t.x,t.y);//
}
surface s=surface(f,(-1,-1),(1,1),1,1,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

triple f(pair t) {
	return (-1,t.x,t.y);//
}
surface s=surface(f,(-1,-1),(1,1),1,1,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
draw(s,emissive(coloronefill),meshpen=p);

label("$(a,a,a)$",(1.05,1.05,1.1));
label("$(-a,-a,-a)$",(-1.05,-1.05,-1.1));
dot((1,1,1),black+1mm);

dot((-1,-1,-1),black+1mm);

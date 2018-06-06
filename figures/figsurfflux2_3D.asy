include apexconfig;

//ASY file for fig:surfflux2 and fig:divthm_space1 in Section 14.6

size(200,200,IgnoreAspect);
currentprojection=orthographic(22.8,20,5.5);

// setup and draw the axes
real[] myxchoice={1};
real[] myychoice={2};
real[] myzchoice={3};

pair xbounds=(-1.1,1.1);
pair ybounds=(-1.1,1.1);
pair zbounds=(-.1,1.1);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the plane unit disk
triple f(pair t) {
	return (t.y*cos(t.x),t.y*sin(t.x),0);//
}
surface s=surface(f,(-pi/2,0),(3pi/2,1),8,8,
usplinetype=Spline,
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colortwo;
draw(s,emissive(colortwofill),meshpen=p);

//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.y*cos(t.x),t.y*sin(t.x),1-t.y^2);//
}
surface s=surface(f,(0,0),(2pi,1),8,8,Spline);
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

pen curvepen=.6mm+colorone;
triple f(real t) {return (cos(t),sin(t),0);}
path3 mypath=graph(f,0,2pi,operator ..);
draw(mypath,curvepen);

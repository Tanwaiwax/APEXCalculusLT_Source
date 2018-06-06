include apexconfig;

//ASY file for fig:parsurfarea in Section 14.5, developing surface area

size(200,200,IgnoreAspect);
currentprojection=orthographic(15.5,18.6,18.1,Z,(0,0,0),1,(0,-.15),true,true);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(.3,.8);
pair ybounds=(.3,.8);
pair zbounds=(.5,1.5);

//Draw the top half of the surface z = x^2+2y^2
triple ff(pair t) {
	return (t.y*(cos(t.x)+.1*sin(3t.x)),t.y*sin(t.x),2-(t.y*(cos(t.x)+.1*sin(3t.x)))^2-(t.y*sin(t.x))^2);//
}

triple f(pair t) {
	return -ff(t)+(1,1,3);
}

surface s=surface(f,(pi/16,8/16),(2pi/4*3/4*10/12,12/16),8,16,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

surface s=surface(f,(2pi/16,9/16),(4pi/16,11/16),8,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;

real u0=2pi/16;
real v0=9/16;
real du=2pi/16;
real dv=2/16;
triple ru=f((u0+du,v0))-f((u0,v0));
triple rv=f((u0+du,v0))-f((u0+du,v0+dv));

triple aa=f((u0+du,v0));
triple bb=aa-ru;
triple cc=bb-rv;
triple dd=cc+ru;

pen curvepen2=.3mm+colortwo;

draw(f((u0+du,v0))--f((u0,v0)),curvepen2,Arrow3(5));
draw(f((u0+du,v0))--f((u0+du,v0+dv)),curvepen2,Arrow3(5));
draw(f((u0+du,v0+dv))--f((u0+du,v0+dv))-ru--f((u0+du,v0+dv))-ru+rv,curvepen2);

label("\scriptsize$P$",f((u0+du,v0))+(.005,-.005,.05));
label("\scriptsize$M$",f((u0,v0))+(0,+.025,.005));
label("\scriptsize$\scriptsize Q$",f((u0+du,v0+dv))+(.005,-.005,.05));

label("\scriptsize$\vec u$",(f((u0+du,v0))+f((u0,v0)))/2+(.05,.005,0));
label("\scriptsize$\vec v$",(f((u0+du,v0))+f((u0+du,v0+dv)))/2+(.005,-.005,.05));

dot(f((u0+du,v0)),.7mm+black);
dot(f((u0,v0)),.7mm+black);
dot(f((u0+du,v0+dv)),.7mm+black);

draw(surface(aa--bb--cc--dd--cycle),emissive(colortwofill));

dot(f((u0+du,v0)),.7mm+black);

surface s=surface(f,(2pi/16,9/16),(4pi/16,9/16),8,1,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(colortwofill),meshpen=curvepen2);

surface s=surface(f,(2pi/16,11/16),(4pi/16,11/16),8,1,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(colortwofill),meshpen=curvepen2);

surface s=surface(f,(2pi/16,9/16),(2pi/16,11/16),1,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(colortwofill),meshpen=curvepen2);

surface s=surface(f,(4pi/16,9/16),(4pi/16,11/16),1,8,
usplinetype=new splinetype[] {notaknot,notaknot,monotonic},
vsplinetype=new splinetype[] {notaknot,notaknot,monotonic});
pen p=colorone;
draw(s,emissive(colortwofill),meshpen=curvepen2);

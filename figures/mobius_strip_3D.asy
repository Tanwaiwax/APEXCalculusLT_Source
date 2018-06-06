include apexconfig;

//ASY file for fig:mobius in Section 14.5

size(200,200,Aspect);
currentprojection=orthographic(6.7,-2,1.9);

triple f(pair t) {
  return ( (1+t.y/2*cos(t.x/2))*cos(t.x),
  (1+t.y/2*cos(t.x/2))*sin(t.x),
  t.y/2*sin(t.x/2) );
}
surface s=surface(f,(0,-.3),(2*pi,.3),50,5);
pen p=colorone+.1mm;
draw(s,emissive(coloronefill),meshpen=p);

triple g(real t) {
  return f((t,.3));
}

path3 mypath=graph(g,-2pi,2pi,operator ..);
draw(mypath,colorone+linewidth(1));

//  Attempted various ways of getting a normal vector. Turns out all
//  were probably ok, it was just that the aspect ratio was off.
//  Used ``Aspect'' in the orthographic line above to fix it.

triple n(real t) {
	return (.5*cos(t)*sin(t/2),(1/2)*(sin(t/2)*sin(t)),-.5*cos(t/2));
	}
//(.5*cos(t)*sin(t/2),(1/4)*(cos(t/2)-cos(3*t/2)),-.5*cos(t/2))

//for(real i=0; i<=2*pi;i=i+2pi/10) {
//draw(f((i,0.)) -- (f((i,0.))+n(i)),rgb(1-i/(2pi),0,i/(2pi))+.2mm,Arrow3);
//}

//draw((f((0,0)).x,0,0) -- (1,0,-.5),rgb(1,0,0)+.2mm,Arrow3);
//draw((0.309017, 0.951057, 0.) -- (0.399835, 1.23057, -0.404508),rgb(.9,0,.1)+.2mm,Arrow3);
//draw((-0.809017, 0.587785, 0.) -- (-1.19373, 0.867294, -0.154508),rgb(.5,0,.5)+.2mm,Arrow3);
//draw((0.309017, -0.951057, 0.) -- (0.399835, -1.23057, 0.404508),rgb(.1,0,.9)+.2mm,Arrow3);

//  Final method of drawing normal vectors. 

for(real i=0; i<=2pi; i=i+2pi/20) {
triple a = f((i+.1,0))-f((i-.1,0));
triple b = f((i,.1))-f((i,-.1));
triple c = .3*(a.y*b.z-a.z*b.y,a.z*b.x-a.x*b.z,a.x*b.y-a.y*b.x)/sqrt(((a.y*b.z-a.z*b.y)^2+(a.z*b.x-a.x*b.z)^2+(a.x*b.y-a.y*b.x)^2));
draw(f((i,0)) -- (f((i,0))+c),rgb(1-i/(2pi),0,i/(2pi))+.2mm,Arrow3);
}

triple a = f((0+.1,0))-f((0-.1,0));
triple b = f((0,.1))-f((0,-.1));
triple c = .3*(a.y*b.z-a.z*b.y,a.z*b.x-a.x*b.z,a.x*b.y-a.y*b.x)/sqrt(((a.y*b.z-a.z*b.y)^2+(a.z*b.x-a.x*b.z)^2+(a.x*b.y-a.y*b.x)^2));
label("end",(f((0,0))+c-(0,0,.1)));

triple a = f((2pi+.1,0))-f((2pi-.1,0));
triple b = f((2pi,.1))-f((2pi,-.1));
triple c = .3*(a.y*b.z-a.z*b.y,a.z*b.x-a.x*b.z,a.x*b.y-a.y*b.x)/sqrt(((a.y*b.z-a.z*b.y)^2+(a.z*b.x-a.x*b.z)^2+(a.x*b.y-a.y*b.x)^2));
label("start",(f((2pi,0))+c+(0,0,.1)));

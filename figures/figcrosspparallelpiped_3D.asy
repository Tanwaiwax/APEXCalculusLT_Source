include apexconfig;

//ASY file for fig:crossp_parallelepiped in Chapter 10 section sec:cross_product

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

//Draw the parallelepiped with u=<1,1,0>, v=<-1,1,0>, w=<0,1,1>
draw((0,0,0)--(1,1,0), Arrow3(size=3mm));// u
label("$\vec{u}$",(1,1,0),W);
draw((0,0,0)--(-1,1,0), Arrow3(size=3mm));// v
label("$\vec{v}$",(-1,1,0),N);
draw((0,0,0)--(0,1,1), Arrow3(size=3mm));// w
label("$\vec{w}$",(0,1,1),W);
//shifted u to get the other edges of the box
draw((-1,1,0)--(0,2,0),colorone);// u shifted to v
draw((0,1,1)--(1,2,1),colorone);// u shifted to w
draw((-1,2,1)--(0,3,1),colorone);// u shifted to v+w
//shifted v to get the other edges of the box
draw((1,1,0)--(0,2,0),colorone);// v shifted to u
draw((0,1,1)--(-1,2,1),colorone);// v shifted to w
draw((1,2,1)--(0,3,1),colorone);// v shifted to u+w
//shifted w to get the other edges of the box
draw((1,1,0)--(1,2,1),colorone);// w shifted to u
draw((-1,1,0)--(-1,2,1),colorone);// w shifted to v
draw((0,2,0)--(0,3,1),colorone);// w shifted to u+v

path3 left = (0,0,0)--(1,1,0)--(0,2,0)--(-1,1,0)--cycle;
draw(surface(left), emissive(coloronefill));
path3 bottom = (0,0,0)--(1,1,0)--(1,2,1)--(0,1,1)--cycle;
draw(surface(bottom), emissive(coloronefill));
path3 right = (-1,1,0)--(0,2,0)--(0,3,1)--(-1,2,1)--cycle;
draw(surface(right), emissive(coloronefill));
path3 back = (0,0,0)--(-1,1,0)--(-1,2,1)--(0,1,1)--cycle;
draw(surface(back), emissive(coloronefill));
path3 front = (1,1,0)--(0,2,0)--(0,3,1)--(1,2,1)--cycle;
draw(surface(front), emissive(coloronefill));
path3 top = (0,1,1)--(1,2,1)--(0,3,1)--(-1,2,1)--cycle;
draw(surface(top), emissive(coloronefill));

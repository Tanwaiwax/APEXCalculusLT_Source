include apexconfig;

//ASY file for fig:disk0 in section sec:disk


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic((8.1,15.5,23.4),(0,1,0),(0,0,0),1,(-0.13,0.0046));

// setup and draw the axes
real[] myxchoice={5};
real[] myychoice={};
real[] myzchoice={};

pair xbounds=(-0.25,8);
pair ybounds=(-8,8);
pair zbounds=(-8,8);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,invisible,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

path3 p=(5,5,5)--(5,-5,5)--(5,-5,-5)--(5,5,-5);
draw(surface(p -- cycle), emissive(coloronefill));
draw(p--cycle,colorone+.3mm);

path3 p1=(0,0,0)--(5,5,5)--(5,-5,5);
draw(surface(p1 -- cycle), emissive(coloronefill));
draw(p1--cycle,colorone+.3mm);

path3 p2=(0,0,0)--(5,5,5)--(5,5,-5);
draw(surface(p2 -- cycle), emissive(coloronefill));
draw(p2--cycle,colorone+.3mm);

path3 p3=(0,0,0)--(5,5,-5)--(5,-5,-5);
draw(surface(p3 -- cycle), emissive(coloronefill));
draw(p3--cycle,colorone+.3mm);

path3 p4=(0,0,0)--(5,-5,5)--(5,-5,-5);
draw(surface(p4 -- cycle), emissive(coloronefill));
draw(p4--cycle,colorone+.3mm);

draw((3,-3,3) -- (3,-3,-3) -- (3,3,-3)-- (3,3,3)--cycle,black+.5mm);


dotfactor=3;
dot((3,0,0));
label("$x$",(3,0,0),S);

label("$2x$",(3,0,3),W);
label("$2x$",(3,3,0),N);
label("$10$",(5,-5,0),S);
label("$10$",(5,0,-5),E);

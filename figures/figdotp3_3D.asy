include apexconfig;

//ASY file for figdotp3.asy in Chapter 10 Section sec:dot_product

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(23,7.4,3.8);

// setup and draw the axes
real[] myxchoice={-5,5};
real[] myychoice={2,4};
real[] myzchoice={-2,2,4};

pair xbounds=(-5.5,5.5);
pair ybounds=(-1,4.5);
pair zbounds=(-2.5,4.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

// Draw the lines for vec{u}=<1,1,1>
draw((0,0,1)--(0,1,1)--(1,1,1)--(1,0,1)--(0,0,1), dashed+linewidth(.5)+colorone);//top 
draw((0,0,0)--(0,1,0)--(1,1,0)--(1,0,0)--(0,0,0), dashed+linewidth(.5)+colorone);//bottom 
draw((1,0,0)--(1,0,1), dashed+linewidth(.5)+colorone);//up1 
draw((0,1,0)--(0,1,1), dashed+linewidth(.5)+colorone);//up2 
draw((1,1,0)--(1,1,1), dashed+linewidth(.5)+colorone);//up3 
draw((0,0,0)--(1,1,1), colorone,Arrow3(size=2mm));
label("$\vec{u}$",(1,1,1),E);
//dotfactor=3;  dot((2,1,1),colorone);

// Draw the lines for \vec{v}=<-1,3,-2>
draw((0,0,-2)--(0,3,-2)--(-1,3,-2)--(-1,0,-2)--(0,0,-2), dashed+linewidth(.5)+colortwo);//top 
draw((0,0,0)--(0,3,0)--(-1,3,0)--(-1,0,0)--(0,0,0), dashed+linewidth(.5)+colortwo);//bottom 
draw((-1,0,0)--(-1,0,-2), dashed+linewidth(.5)+colortwo);//up1 
draw((0,3,0)--(0,3,-2), dashed+linewidth(.5)+colortwo);//up2
draw((-1,3,0)--(-1,3,-2), dashed+linewidth(.5)+colortwo);//up3 
draw((0,0,0)--(-1,3,-2),colortwo,Arrow3(size=2mm));
label("$\vec{v}$",(-1,3,-2),E);

// Draw the lines for \vec{w}=<-5,1,4>
draw((0,0,4)--(0,1,4)--(-5,1,4)--(-5,0,4)--(0,0,4), dashed+linewidth(.5)+colorthree);//top 
draw((0,0,0)--(0,1,0)--(-5,1,0)--(-5,0,0)--(0,0,0), dashed+linewidth(.5)+colorthree);//bottom 
draw((-5,0,0)--(-5,0,4), dashed+linewidth(.5)+colorthree);//up1 
draw((0,1,0)--(0,1,4), dashed+linewidth(.5)+colorthree);//up2
draw((-5,1,0)--(-5,1,4), dashed+linewidth(.5)+colorthree);//up3 
draw((0,0,0)--(-5,1,4), colorthree,Arrow3(size=2mm));
label("$\vec{w}$",(-5,1,4),E);

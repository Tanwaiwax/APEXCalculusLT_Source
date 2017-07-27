include apexconfig;

//ASY file for fig:multigraph_intro in Chapter 12 sec:multi_intro

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(8,8,1.5);

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={0.5,1};

pair xbounds=(-2.5,2.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-0.25,1.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw 25 points on the surface z=1/(1+x^2+y^2)
dotfactor=3;
for (int i=-2 ; i<=2 ; ++i) {
 for (int j=-2 ; j<=2 ; ++j) {
  dot((i,j,1/(1+i^2+j^2)),colorone);
 }
}

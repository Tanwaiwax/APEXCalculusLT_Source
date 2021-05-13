include apexconfig;

//ASY file for fig:conopt2 in Chapter 12 sec:multi_extreme_values

size(200,200,IgnoreAspect);
//size(200,200,Aspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(176,-2075,580);

// setup and draw the axes
real[] myxchoice={20};
real[] myychoice={50,100};
//real[] myzchoice={20,40,60,80}; // causes "illegal hardware instruction"
real[] myzchoice={25,50,75};

pair xbounds=(-5,40);
pair ybounds=(-2,150);
//pair zbounds=(0,100000);
pair zbounds=(0,100);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$w$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$\ell$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label(minipage("\centering $V$\\ (in thousands)"),(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)),N);

//Draw surface z=x^2*y
triple f(pair t) {
  return (t.x,t.y,t.x^2*t.y/1000);
}
surface s=surface(f,(0,0),(32.5,130),16,16,Spline);
draw(s,emissive(coloronefill),meshpen=colorone);

//Draw path in plane
draw((32.5,0,0)--(0,130,0),colortwo+dashed+linewidth(1));

//Draw path on surface
triple g(real t) {return (t,130-4*t,t^2*(130-4*t)/1000);}
path3 mypath=graph(g,0,32.5,operator ..);
draw(mypath,colortwo); //side 1


//Dots at max point
dotfactor=4;
dot((21.67,43.33,19.4));

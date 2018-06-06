include apexconfig;

//ASY file for fig:cylindrical3 in Section 13.7

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);

// setup and draw the axes
real[] myxchoice={};
real[] myychoice={};
real[] myzchoice={};
defaultpen(0.5mm);

pair xbounds=(-2,2);
pair ybounds=(-2,2);
pair zbounds=(-2,2);

triple f(pair t) {
  return (cos(3*t.x)*cos(t.x),cos(3*t.x)*sin(t.x),(1-cos(3*t.x)*cos(t.x)+.1*cos(3*t.x)*sin(t.x))*t.y);
}
surface s=surface(f,(0,0),(2*pi,1),32,32,Spline);
pen p=colorone;
draw(s,emissive(coloronefill),meshpen=p);

//draw curve on xy plane //({cos(3*x)*cos(x)},{cos(3*x)*sin(x)},{0})
triple g(real t) {return (cos(3*t)*cos(t),cos(3*t)*sin(t),0);}
path3 mypath=graph(g,0,pi,operator ..);
draw(mypath,colorone+linewidth(2));

//draw curves on surface
triple g(real t) {return (cos(3*t)*cos(t),cos(3*t)*sin(t),1-(cos(3*t)*cos(t))+0.1*(cos(3*t)*sin(t)));}
path3 mypath=graph(g,0,pi,operator ..);
draw(mypath,colorone+linewidth(2));

// shouldn't these be functions?

//Shade the bottom
path3 p =  (0,0,0)..(.175,0.064,0)..(.264,.119,0)..(0.683,0.183,0)..(.916,0.121,0)..(1,0,0)..(.916,-0.121,0)..(0.683,-0.183,0)..(.264,-.119,0)..(.175,-0.086,0); 
draw(surface(p -- cycle), emissive(coloronefill));

path3 p = (0,0,0)..(-0.1429, 0.1196,0)..(-0.2351, 0.1691,0)..(-0.5000, 0.5000,0)..(-0.5628, 0.7328,0)..(-0.5000, 0.8660,0)..(-0.3532, 0.8538,0)..(-0.1830, 0.6830,0)..(-0.0289, 0.2881,0)..(-0.0130, 0.1946,0);
draw(surface(p -- cycle), emissive(coloronefill));

path3 p = (0,0,0)..(-0.0321,-0.1836,0)..(-0.0289,-0.2881,0)..(-0.1830,-0.6830,0)..(-0.3532,-0.8538,0)..(-0.5000,-0.8660,0)..(-0.5628,-0.7328,0)..(-0.5000,-0.5000,0)..(-0.2351,-0.1691,0)..(-0.1620,-0.1086,0);
draw(surface(p -- cycle), emissive(coloronefill));

//Shade the top
path3 p = (0,0,1.0000)..(-0.1429,0.1196,1.1549)..(-0.2351,0.1691,1.2520)..(-0.5000,0.5000,1.5500)..(-0.5628,0.7328,1.6361)..(-0.5000,0.8660,1.5866)..(-0.3532,0.8538,1.4386)..(-0.1830 ,0.6830 ,1.2513)..(-0.0289,0.2881,1.0578)..(-0.0130,0.1946,1.0325);

draw(surface(p -- cycle), emissive(coloronefill));
path3 p = (0 ,        0  ,  1.0000)..(-0.0321 ,  -0.1836 ,   1.0137)..(-0.0289,   -0.2881,    1.0001)..(-0.1830,   -0.6830,    1.1147)..(-0.3532  , -0.8538 ,   1.2678)..(-0.5000,   -0.8660 ,   1.4134)..(-0.5628 ,  -0.7328,    1.4895)..(-0.5000 ,  -0.5000 ,   1.4500)..(-0.2351 ,  -0.1691 ,   1.2181)..(-0.1620 ,  -0.1086,    1.1511);
draw(surface(p -- cycle), emissive(coloronefill));

path3 p = (0 ,        0,    1.0000)..( 0.1750,    0.0640 ,   0.8314)..( 0.2640,    0.1190 ,   0.7479)..( 0.6830,    0.1830 ,   0.3353)..( 0.9160,    0.1210 ,   0.0961)..( 1.0000,         0 ,        0)..( 0.9160,   -0.1210 ,   0.0719)..( 0.6830,   -0.1830 ,   0.2987)..( 0.2640,   -0.1190 ,   0.7241)..( 0.1750,   -0.0860 ,   0.8164);
draw(surface(p -- cycle), emissive(coloronefill));

// asy [-noprc] file.asy

// begin the asy file with
// include apexconfig;
settings.outformat = settings.prc ? "prc" : "pdf";
settings.tex = "xelatex";
settings.embed = true;

import three;
import graph3;
import labelpath3;
defaultrender.merge=true;

//usepackage("amsmath");
usepackage("mathspec");
usepackage("esvect");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

defaultpen(0.5mm);

size(200,200,IgnoreAspect);
currentprojection=orthographic(2.9,2.6,1.5);

// setup and draw the axes
real[] myxchoice={-20,20};
real[] myychoice={-20,20};
real[] myzchoice={20};

pair xbounds=(-25,25);
pair ybounds=(-25,25);
pair zbounds=(0,30);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

triple f(real t) {return (cos(t)*t,sin(t)*t,t);}
draw(graph(f,0,30,operator ..),black);

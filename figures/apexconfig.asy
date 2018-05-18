// begin the asy file with
// include apexconfig;
//settings.outformat = settings.prc ? "prc" : "pdf";
settings.tex = "xelatex";
settings.embed = true;

// using the command line switch -bw causes the entire image to be blacked out
// we'll fake it and just use grayscale for all of our colors
// on the command line, this requires using: -user apexbw=true
bool apexbw = false;
usersetting();

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

pen colorone = apexbw ? black : blue;
pen colortwo = apexbw ? .5*black+.5*white : red;
pen colorthree = apexbw ? .25*black+.75*white : green;
pen coloronetwo = .5*colorone + .5*colortwo;
pen coloronefill = apexbw ? colortwo+opacity(0.5) : rgb(.6,.6,1)+opacity(0.5);
pen colortwofill = apexbw ? colortwo+opacity(0.5) : rgb(1,.6,.6)+opacity(0.5);

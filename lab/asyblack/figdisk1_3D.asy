settings.outformat = "pdf";

import graph3;
currentprojection=orthographic((18,7.7,21.1),(0,1,0),(0,0,0),1,(-0.088,.0039));

size(200,200,IgnoreAspect);

// setup and draw the axes
real[] myxchoice={1,2};

xaxis3("",-0.1,2.2,black,OutTicks(myxchoice),Arrow3(size=3mm));

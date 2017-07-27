APEXCalculusLT_Source
===================

Source files for the APEX Calculus LT text, Version 3.1.

The main file is Calculus.tex, intended to be run with XeLaTeX with the Calibri font. 
(It will run without Calibri and with pdflatex, but the spacing will be different than intended. One can try using the Carlito font, which is an open font with (supposedly) the same font metrics as Calibri. I have not yet tried it personally.)

There are a variety of compilation options.
This is simplified by using make.py (a Python2 script) which calls latexmk.
Running `./make.py` will give the various options.
Compiling with a single set of options will take three to five minutes.
Running `./make.py -a` will create seven different pdfs after about twenty minutes.  Running `./make.py -n` will use latexml to make a complete website version of the book after about three hours.
(Unfortunately, latexmk appears to be a little too agressive in ignoring compilation errors.  I recommend compiling using your regular method first, and once you know it compiles, then use latexmk.)

The directory `figures/matrices` exists because of the bug mentioned at https://github.com/brucemiller/LaTeXML/issues/794.  In the meantime, regular LaTeX versions include the tikz code, while LaTeXML versions include the pdf graphics of the output.

This work is covered with a Creative Commons 4.0 By-NC copyright.

#### Supporting programs
The following programs are used for compiling everything from start to finish:
* Python2 to invoke make.py
* [pdfsizeopt](https://github.com/pts/pdfsizeopt/) to minimize the size of the pdf file
* [LaTeXML](http://dlmf.nist.gov/LaTeXML/) to convert the book into a website
* [Asymptote](http://asymptote.sourceforge.net/) to create the three dimensional graphics

Enjoy.

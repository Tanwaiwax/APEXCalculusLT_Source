APEXCalculus_Source
===================

Source files for the APEX Calculus text, Version 3.0.

The main file is Calculus.tex, intended to be run with XeLaTeX with the Calibri font. 
(It will run without Calibri and with pdflatex, but the spacing will be different than intended. One can try using the Carlito font, which is an open font with (supposedly) the same font metrics as Calibri. I have not yet tried it personally.)

There are a variety of compilation options.  This is simplified by
using make.py (a Python script) which calls latexmk.
Running `./make.py` will give the various options.
Compiling with a single set of options will take two to three
minutes.  Running `./make.py -a` will create sixteen different pdfs
after about twenty to thirty minutes.  Running `./make.py -n` will
use latexml to make a complete website version of the book after
about thirty to forty minutes.

The current released versions for latexml have a bug that makes
`\hyperref[label]{text}` format incorrectly. The most recent version
of the files `hyperref.sty.ltxml` and `nameref.sty.ltxml` are included
to fix that bug.  

This work is covered with a Creative Commons 3.0 By-NC copyright.

Enjoy.

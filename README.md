APEXCalculusLT_Source
===================

Source files for the APEX Calculus LT text, Version 3.1.

The main file is Calculus.tex, intended to be run with XeLaTeX with the Calibri font. 
(It will run without Calibri and with pdflatex, but the spacing will be different than intended. One can try using the Carlito font, which is an open font with (supposedly) the same font metrics as Calibri. I have not yet tried it personally.)

There are a variety of compilation options.
This is simplified by using make.py (a Python script) which calls latexmk.
Running `./make.py` will give the various options.
Compiling with a single set of options will take two to three minutes.
Running `./make.py -a` will create sixteen different pdfs after about twenty minutes.  Running `./make.py -n` will use latexml to make a complete website version of the book after about thirty to forty minutes.
(Unfortunately, latexmk appears to be a little too agressive in ignoring compilation errors.  I recommend compiling using your regular method first, and once you know it compiles, then use latexmk.)

The directory `figures/matrices` exists because of the bug mentioned at https://github.com/brucemiller/LaTeXML/issues/794.  In the meantime, regular LaTeX versions include the tikz code, while LaTeXML versions include the pdf graphics of the output.

This work is covered with a Creative Commons 4.0 By-NC copyright.

####Incompatabilities with the original APEX Calculus:####
The original goal was to allow the style files and the text files for LT and ET to be arbitrarily interchanged.  This wound up not being the case, for various reasons.  Among them:
* `\mfigure`/`\mtable`/`\mnote`/`\mfigurethree` have been redefined to use marginpar instead of AddToShipOut.  This tends to be more stable as the notes shift around.  The result of this is that the first argument (optional in the case of table and note) specifies the vertical offset from where XeLaTeX would have put the item otherwise. 
* `\apexchapter[prerequisite_section]{Chapter Name}{label}` is being used instead of the `\chapter{Chapter Name}` command.  This allows consistent commands at the beginning of the chapter, one of which is resetting the `chapter_already_has_exercises` boolean, so that putting the chapter number in the solutions to selected problems section is more reliable.
* The `\example` command has been adjusted so that spacing happens automatically (generally) instead of requiring each example to end with `\vskip -\baselineskip}\\`.

Enjoy.

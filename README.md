APEXCalculusLT_Source
===================

Source files for the APEX Calculus LT text, Version 3.1.  The resulting pdfs (or recent versions thereof) are posted at https://arts-sciences.und.edu/academics/math/calc-1-texts.html

The main file is Calculus.tex, intended to be run with XeLaTeX with the Calibri font. 
(It will run without Calibri and with pdflatex, but the spacing will be different than intended.
One can try using the Carlito font, which is an open font with (supposedly) the same font metrics as Calibri.
I have not yet tried it personally.)

There are a variety of compilation options.
This is simplified by using make.py (a Python2 script) which calls latexmk.
Running `./make.py` will give the various options.
Compiling with a single set of options will take three to five minutes.
Running `./make.py -a` will create seven different pdfs after about twenty minutes.
Running `./make.py -n` will use latexml to make a complete website version of the book after about three hours.
(Unfortunately, latexmk appears to be a little too agressive in ignoring compilation errors.
I recommend compiling using your regular method first, and once you know it compiles, then use latexmk.)

This work is covered with a Creative Commons 4.0 By-NC copyright.

#### Rearrangements from ET
If you find an outside reference to Apex (for example, Webwork), it is likely referring to the original, early trancendentals, version.
Most of the exercises in one are also found in the other, although under different numbering (but often with the same parity).
The bigger change is to the section ordering.
|LT Section|ET Section|
|---|---|
|1.5|1.6|
|1.6|1.5|
|4.1-4.3|4.2-4.4|
|4.4|4.1|
|5.5|6.1|
|6.1-6.3|7.1-7.3|
|6.4-6.5|7.5-7.6|
|7.1||
|7.2|2.7|
|7.3||
|7.4|6.6|
|7.5|6.7|
|8.1-8.4|6.2-6.5|
|8.5||
|8.6|6.8|
|8.7|5.5|
|9.1-9.2|8.1-8.2|
|9.3-9.4|8.3|
|9.5|8.5|
|9.6|8.4|
|9.7||
|9.8-9.10|8.6-8.8|
|10.0|9.1|
|10.1|7.4|
|13.9||

With the noted exceptions, the introduction of LT chapter 7 means that ET chapter n = LT chapter (n+1), once n is at least 8.

#### Supporting programs
The following programs are used for compiling everything from start to finish:
* [LaTeX](https://www.tug.org/texlive/)
* [Python2](https://www.python.org/) to invoke make.py
* [pdfsizeopt](https://github.com/pts/pdfsizeopt/) to minimize the size of the pdf file
* [LaTeXML](http://dlmf.nist.gov/LaTeXML/) to convert the book into a website
* [Asymptote](http://asymptote.sourceforge.net/) to create the three dimensional graphics

Enjoy.

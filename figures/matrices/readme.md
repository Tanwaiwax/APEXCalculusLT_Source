This directory exists because of the bug mentioned at https://github.com/brucemiller/LaTeXML/issues/794.  In the meantime, regular LaTeX versions include the tikz code, while LaTeXML versions include the pdf graphics of the output.

By playing around with xelatex's command line, we can always compile the file matrix.tex.  It inputs its jobname, which we set to various source files.  It's possible we're being too clever by half, but doing this cuts down on the number of auxiliary files in the directory.

The command line ends up being:  
`xelatex -synctex=0 -jobname=<myjobname> matrix`

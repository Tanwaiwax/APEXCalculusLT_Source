#!/usr/local/bin/python3

import re
from glob import glob

for exfilename in glob('*.tex'):
    with open(exfilename) as exfile:
        lines = exfile.read()
    if not re.search(r'(?<!\\pdftooltip{)\\begin{tikzpicture}', lines):
        continue
    print(exfilename)
#    if not re.search(r'(?<!\\pdftooltip{)\\begin{tikzpicture}(.*?)\\end{tikzpicture}', lines, re.DOTALL):
#        breakpoint()
#    quit()
    lines = re.sub(r'(?<!\\pdftooltip{)\\begin{tikzpicture}(.*?)\\end{tikzpicture}',
                    r'\\pdftooltip{\\begin{tikzpicture}\1\\end{tikzpicture}}{ALT-TEXT-TO-BE-DETERMINED}',
                    lines, flags=re.DOTALL)
    with open(exfilename, 'w') as exfile:
        exfile.write(lines)

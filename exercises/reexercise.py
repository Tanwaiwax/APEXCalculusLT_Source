#!/usr/local/bin/python3

import re
from glob import glob

for exfilename in glob('*.tex'):
    with open(exfilename) as exfile:
        lines = exfile.read()
    lines = re.sub(r'\\begin{exerciseset}{In Exercises}', r'\\exercisesetinstructions', lines)
    if re.match(r'\\begin{exerciseset}', lines):
        print(exfilename)
    lines = re.sub(r'\\end{exerciseset}', r'\\exercisesetend', lines)
    with open(exfilename, 'w') as exfile:
        exfile.write(lines)

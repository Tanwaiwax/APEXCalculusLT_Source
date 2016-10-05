#!/usr/local/bin/python3

import re
from os import rename
from glob import iglob

def replaceexinputs(lines):
    def exfilecontents(matchobj):
        exfilename = matchobj.group(1).replace('exercises/','')+'.tex'
        try:
            with open(exfilename) as exfile:
                contents = exfile.read()
            rename(exfilename,'hidden/'+exfilename)
        except FileNotFoundError:
            try:
                with open('hidden/'+exfilename) as exfile:
                    contents = exfile.read()
            except FileNotFoundError:
                print('file',exfilename,'not found')
                return '%'+matchobj.group(0)
        contents = re.sub(r'\s+$','\n',contents)
        return r'\exercise'+contents

    lines = re.sub(r'\\exinput\{(.+?)\}',exfilecontents,lines)
    lines = lines.replace('}\n{','}{')
    return lines


for setfilename in iglob('*exset*.tex'):
    lines = r'\exerciseset'
    with open(setfilename) as exsetfile:
        lines = lines+exsetfile.read()
    if 'exinput' not in lines:
        next
    lines = lines.replace(r'{\noindent ','{',1).replace(r'}\n{','}{',1)
    lines = re.sub(r'}\s*\\exinput','}{\n\n\exinput',lines,1)
    lines = replaceexinputs(lines)+'}'
    newsetfilename = 'new'+setfilename
    with open(newsetfilename,'w') as newexfile:
        newexfile.write(lines)
    rename(setfilename,'hidden/'+setfilename)
    rename(newsetfilename,setfilename)


for sectexername in iglob('*exercises*'):
    with open(sectexername) as sectexerfile:
        lines = sectexerfile.read()
    if 'exinput' not in lines and 'exsetinput' not in lines:
        next
    lines = lines.replace(r'{\noindent ','{',1).replace(r'}\n{','}{',1)
    lines = replaceexinputs(lines)
    lines = lines.replace('exsetinput','input')
    newfilename = 'new'+sectexername
    with open(newfilename,'w') as newsectexfile:
        newsectexfile.write(lines)
    rename(sectexername,'hidden/'+sectexername)
    rename(newfilename,sectexername)

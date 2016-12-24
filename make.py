#!/usr/local/bin/python3

import re
import os
import sys
import glob
import time
import shutil
import argparse
import platform
import itertools
import subprocess

start = time.time()

asyfiles = ['figdisk1_3D','figwash1c_3D','figsq_rt_3D','figsq_rt_b_3D',
            'figwash4_3D','figwash4b_3D','figshellparab_3D',
            'figshellparab_b_3D','figarc4_3D','figarc4_b_3D']

parser = argparse.ArgumentParser(description='Compile document to a pdf.',
                                 epilog="If no options are given, "
                                 "--help is assumed.")

parser.add_argument("-a","--all", action="store_true",
                    help="Creates all versions (ignores other options).")

parser.add_argument("-c","--calculus", type=int, choices=[0,1,2,3,4],
                    default=0,
                    help="Calculus semester 1, 2, 3, or (default) all. (1 or 4 min)")

parser.add_argument("-f","--figures", action="store_true",
                    help="Create 3D figures using Asymptote.")

parser.add_argument("-i","--instructor", action="store_true",
                    help="Create instructor solution manual.")

parser.add_argument("-n","--internet", action="store_true",
                    help="Create interNet version (options x & w).")

parser.add_argument("-x","--xml", action="store_true",
                    help="Create xml version. (120 min)");

parser.add_argument("-w","--web", action="store_true",
                    help="Convert xml version to html. (4 min)");

parser.add_argument("-t","--todo", action="store_true",
                    help="Update todo lists.");

parser.add_argument("-q","--quit", action="store_true",
                    help="Write options.tex and quit.")

group = parser.add_mutually_exclusive_group()

group.add_argument("-b","--blackwhite", action="store_true",
                   help="Print static graphics in black and white (default is color).")

group.add_argument("-s","--static", action="store_true",
                   help="Print static color graphics (default is interactive).")

os.makedirs('ApexPDFs',exist_ok=True)
os.makedirs('logs',exist_ok=True)
os.makedirs('web',exist_ok=True)

if len(sys.argv)==1:
    parser.print_help()
    exit()

args = parser.parse_args()

def getTime():
    end = time.time()
    seconds = int(end-start)
    return (seconds//60,seconds%60)

def makefigs():
    try:
        os.chdir('figures')
        for asyfile in asyfiles:
            exts = ('.pdf','.prc','BW.pdf','BW.prc')
            try:
                oldest_bin_time = min(os.path.getmtime(asyfile+ext) for ext in exts)
            except FileNotFoundError:
                oldest_bin_time = -float("infinity")
            if ( os.path.getmtime(asyfile+'.asy') < oldest_bin_time ):
                continue
            # -user apexbw=true runs that command in apexconfig.asy
            # using -bw causes the figure to be blacked out (?!)
            bwopts = ( [], ['-user','apexbw=true','-outname',asyfile+'BW'] )
            prcopts = ( [], ['-noprc'] )
            for prcopt,bwopt in itertools.product(prcopts,bwopts):
                subprocess.check_call(['asy']+prcopt+bwopt+[asyfile])
        for outfile in glob.iglob("*.out"):
            if ( os.path.getsize(outfile) == 0 ):
                os.remove(outfile)
    finally:
        os.chdir('..')

def updatetodo():
    output = subprocess.check_output(['grep','todo','-Ir','.'])
    todos = output.decode('utf-8').split("\n")
    todotim = []
    todocalc1 = []
    todocalc2 = []
    for todo in todos:
        if re.match('./make.py',todo) or re.match('./todo_',todo) or todo == '':
            continue
        if ' Tim ' in todo:
            todotim.append(todo)
        elif re.search('/0[1-4]',todo):
            todocalc1.append(todo)
        else:
            todocalc2.append(todo)
    todosin = {
        'todo_tim.txt': todotim,
        'todo_calc1.txt': todocalc1,
        'todo_calc2.txt': todocalc2
    }
    for filename,todolist in todosin.items():
        with open(filename,'w') as timfile:
            print(*todolist,sep='\n',file=timfile)
        
def writeoptions(args):
    with open('options.tex','w') as options:
        title = "Calculus"
        if args.calculus in (1,2,3):
            iii = "I"*args.calculus
            title += " "+iii
            options.write(r"\includeonly{Calculus"+iii+"}\n")
        options.write(r"\newcommand{\thetitle}{"+title+"}\n")
        if args.blackwhite:
            options.write("\\printinblackandwhite\n")
            options.write("\\usetwoDgraphics\n")
        elif args.static:
            options.write("\\printincolor\n")
            options.write("\\usetwoDgraphics\n")
        else:
            options.write("\\printincolor\n")
            options.write("\\usethreeDgraphics\n")

def getsuffix(args):
    if args.xml:
        return "_xml"
    elif args.web:
        return "_web"
    elif args.instructor:
        return "_answers"
    newsuffix = ''
    if args.calculus in (1,2,3):
        iii = "I"*args.calculus
        newsuffix += "_"+iii
    if args.blackwhite:
        newsuffix += "_BW"
    elif args.static:
        newsuffix += "_small"
    return newsuffix

def getcommandline(args):
    if args.xml:
        ret = ['latexml','--quiet',#'--quiet',#'--verbose','--verbose',#
                       '--destination=calculus.xml',
                       'Calculus']
        if platform.mac_ver()[0] is '':
            return ret
        else:
            return ['caffeinate','-s'] + ret
            # prevent sleeping, if plugged in, until command finished
    if args.web:
        #os.chdir('web')
#        return
        return ['latexmlpost','--quiet','--split','--stylesheet=web/apex.xsl',
                    '--destination=web/index.html','--css=style.css',
                    '--javascript=https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js',
                    '--javascript=LaTeXML-maybeMathJax.js',
                    '--javascript=script.js','calculus.xml']
    if args.internet:
        return
    if args.instructor:
        return ['latexmk','-xelatex','Answers']
    return ['latexmk','-xelatex','Calculus']

def compilewith(commands=False):
    if commands:
        args = parser.parse_args([''.join(commands)])
    else:
        args = parser.parse_args()
    if args.figures:
        makefigs()
        return
    if args.todo:
        updatetodo()
        return
    if args.calculus == 4:
        args.calculus = 0
    writeoptions(args)
    if args.quit:
        return
    newsuffix = getsuffix(args)
    if args.xml or args.web or args.instructor:
        compilewith("-qsc0")
    elif args.internet:
        compilewith("-x")
        compilewith("-w")
        return
    with open('logs/compilation'+newsuffix+'.log','w') as mystdout:
        try:
            commandline = getcommandline(args)
#            print("running",commandline)
            subprocess.check_call(commandline,stdout=mystdout,stderr=subprocess.STDOUT)
        except:
            time = "{0[0]:02d}:{0[1]:02d}".format(getTime())
            print("At",time,"failing command:",commands);
            raise
        finally:
            if args.web:
                #os.chdir('..')
                pass
    time = "{0[0]:02d}:{0[1]:02d}".format(getTime())
    if commands:
        print("Command line:",commands,"finished at",time)
    else:
        print("Command line finished at",time)
    if not args.xml and not args.web and not args.instructor:
        os.rename("Calculus.pdf","ApexPDFs/Calculus"+newsuffix+".pdf")

if args.all:
    compilewith('-f')
    for part,size in itertools.product('0123',["","s","b"]):
        # switch the order so that all parts are compiled together to speed
        # up compilation, since the index shouldn't need to be recommputed
        compilewith('-'+size+'c'+part)
    compilewith('-i')
else:
    compilewith()

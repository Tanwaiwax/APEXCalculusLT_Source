#!/usr/local/bin/python3

import os
import sys
import time
import shutil
import argparse
import platform
import itertools
import subprocess

start = time.time()

parser = argparse.ArgumentParser(description='Compile document to a pdf.',
                                 epilog="If no options are given, "
                                 "--help is assumed.")

parser.add_argument("-a","--all", action="store_true",
                    help="Creates all versions (ignores other options).")

parser.add_argument("-c","--calculus", type=int, choices=[0,1,2,3,4],
                    default=0,
                    help="Calculus semester 1, 2, 3, or (default) all. (3 or 5 min).")

parser.add_argument("-i","--instructor", action="store_true",
                    help="Instructor version "
                    "(prints all answers; default is student).")

parser.add_argument("-p","--programmer", action="store_true",
                    help="Programmer version "
                    "(prints question/answer source; default is no; implies -i).")

parser.add_argument("-n","--internet", action="store_true",
                    help="Create interNet version (options x, w, & t).")

parser.add_argument("-x","--xml", action="store_true",
                    help="Create xml version. (2 min)");

parser.add_argument("-w","--web", action="store_true",
                    help="Convert xml version to html. (40 min)");

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

def compilewith(commands=False):
    if commands:
        args = parser.parse_args([''.join(commands)])
    else:
        args = parser.parse_args()
    newsuffix = ''
    with open('options.tex','w') as options:
        if args.calculus == 4:
            args.calculus = 0
        title = "Calculus"
        if args.calculus in (1,2,3):
            iii = "I"*args.calculus
            options.write(r"\includeonly{Calculus"+iii+"}\n")
            title += " "+iii
            newsuffix += "_"+iii
        options.write(r"\newcommand{\thetitle}{"+title+"}\n")
        if args.programmer:
            options.write("\\printallanswers\n")
            newsuffix += "_prg"
        if args.programmer:
            options.write("\\printexercisenames\n")
        if args.blackwhite:
            options.write("\\printinblackandwhite\n")
            options.write("\\usetwoDgraphics\n")
            newsuffix += "_BW"
        elif args.static:
            options.write("\\printincolor\n")
            options.write("\\usetwoDgraphics\n")
            newsuffix += "_small"
        else:
            options.write("\\printincolor\n")
            options.write("\\usethreeDgraphics\n")
        #print("options written:",commands)
    commandline = []
    if args.quit:
        return
    if args.xml or args.web:
        compilewith("-qsc0")
    if args.xml:
        newsuffix = "_xml"
        commandline = ['latexml',#'--verbose','--verbose',#'--quiet',#
                       '--destination=calculus.xml',
                       'Calculus']
        if platform.mac_ver()[0] is not '':
            commandline = ['caffeinate','-s'] + commandline
            # prevent sleeping, if plugged in, until command finished
    elif args.web:
#        shutil.copy('web/style.css','.')
#        shutil.copy('web/script.js','.')
        newsuffix = "_web"
        commandline = ['latexmlpost','--quiet','--split',
                       '--stylesheet=apex.xsl',
                       '--destination=web/index.html',
                       '--css=style.css',
                       '--javascript=https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js',
                       '--javascript=LaTeXML-maybeMathJax.js',
                       '--javascript=script.js',
                       'calculus.xml']
    elif args.internet:
        compilewith("-x")
        compilewith("-w")
        return
    elif args.instructor:
        commandline = ['latexmk','-xelatex','Answers']
        newsuffix = "_answers"
    else:
        commandline = ['latexmk','-xelatex','Calculus']
    with open('logs/compilation'+newsuffix+'.log','w') as mystdout:
        try:
            print("running",commandline)
            subprocess.check_call(commandline,stdout=mystdout,stderr=subprocess.STDOUT)
        except:
            print("Failing command:",commands);
            raise
    time = "{0[0]:02d}:{0[1]:02d}".format(getTime())
    if commands:
        print("Command line:",commands,"finished at",time)
    else:
        print("Command line finished at",time)
    if not args.xml and not args.web and not args.instructor:
        os.rename("Calculus.pdf","ApexPDFs/Calculus"+newsuffix+".pdf")

if args.all:
    for part,size in itertools.product('0123',["","s","b"]):
        # switch the order so that all parts are compiled together to speed
        # up compilation, since the index shouldn't need to be recommputed
        compilewith('-'+size+'c'+part)
    compilewith('-i')
else:
    compilewith()

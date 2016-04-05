#!/usr/local/bin/python3

import os
import sys
import time
import argparse
import itertools
import subprocess

start = time.time()

parser = argparse.ArgumentParser(description='Compile document to a pdf.',
                                 epilog="If no options are given, "
                                 "--help is assumed.")

parser.add_argument("-a","--all", action="store_true",
                    help="creates all versions (ignores all other options)")

parser.add_argument("-c","--calculus", type=int, choices=[0,1,2,3,4],
                    default=0,
                    help="calculus semester 1, 2, 3, or (default) all")

parser.add_argument("-i","--instructor", action="store_true",
                    help="instructor version "
                    "(prints all answers; default is student)")

group = parser.add_mutually_exclusive_group()

group.add_argument("-b","--blackwhite", action="store_true",
                   help="print static graphics in black and white (default is color)")

group.add_argument("-s","--static", action="store_true",
                   help="print static color graphics (default is interactive)")

os.makedirs('pdf',exist_ok=True)

if len(sys.argv)==1:
    parser.print_help()
    exit()

args = parser.parse_args()

def printTime():
    end = time.time()
    seconds = int(end-start)
    print("Time taken:",(seconds//60),"min",(seconds%60),"sec")

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
        if args.instructor:
            options.write("\\printallanswers\n")
            newsuffix += "_instr"
        elif args.blackwhite:
            options.write("\\printinblackandwhite\n")
            newsuffix += "_BW"
        elif args.static:
            options.write("\\printincolor\n")
            options.write("\\usetwoDgraphics\n")
            newsuffix += "_small"
        else:
            options.write("\\printincolor\n")
            options.write("\\usethreeDgraphics\n")
    try:
        subprocess.check_call(['latexmk','-silent','-xelatex','Calculus'])
    except:
        print("Failing command:",commands);
        raise
    print("Command line:",commands,"finished.")
    printTime()
    os.rename("Calculus.pdf","pdf/Calculus"+newsuffix+".pdf")

if args.all:
    for part,size in itertools.product('0123',["","s","b","ib"]):
        # switch the order so that all parts are compiled together to speed
        # up compilation, since the index shouldn't need to be recommputed
        compilewith('-'+size+'c'+part)
else:
    compilewith()

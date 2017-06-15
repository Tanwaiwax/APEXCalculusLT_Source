#!/usr/bin/python

"""This could be Python 3 by changing the few print statements.  But see the calls to pdfsizeopt, which must have Python 2, because it uses old style print statements."""

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

asyfiles = ['conicalhelix','cyl_surf_r','cyl_surf_t','cyl_surf_z',
            'fig10_01_ex_19_3D','fig10_01_ex_20_3D','fig10_01_ex_21_3D','fig10_01_ex_22_3D',
            'figarc4_3D','figarc4_b_3D',
            'figcartcoord1_3D','figcartcoord2_3D',
            'figcross_area1a_3D','figcross_area1a_3D','figcross1_3D','figcrossp_rhr_3D','figcrossp4a_3D','figcrossp6_3D','figcrosspparallelpiped_3D',
            'figdisk1_3D','figdisk1a_3D','figdisk1b_3D','figdisk2a_3D','figdotp3_3D',
            'figgabriel_3D',
            'figlines_dist2_3D','figlines_intro_3D','figlines1_3D','figlines2_3D','figlines3_3D','figlines6_3D',
            'figmass2_3D','figmotion6_3D',
            'figparcalc8_3D','figplanes_dist_3D','figplanes_intro_3D','figplanes1_3D','figplanes2_3D','figplanes3_3D','figplanes4_3D','figplanes5_3D','figpolcalc8a_3D',
            'figquadric_cone_3D','figquadric_coneb_3D','figquadric_conec_3D','figquadric_ellipsoid_3D','figquadric_ellipsoidb_3D',
            'figquadric_hyp_one_sheet_3D','figquadric_hyp_one_sheetb_3D','figquadric_hyp_par_3D','figquadric_hyp_parb_3D','figquadric_hyp_parc_3D',
            'figquadric_hyp_two_sheet_3D','figquadric_hyp_two_sheetb_3D','figquadric_par_3D','figquadric_parb_3D',
            'figsa1_3D','figsa2a_3D','figsa2b_3D',
            'figshell_intro_a_3D','figshell_intro_d_3D','figshell2b_3D','figshell2c_3D','figshell3b_3D','figshell3c_3D','figshellparab_b_3D','figshellparab_b_3D',
            'figspace1_3D','figspace2_3D','figspace3_3D','figspace4a_3D','figspace4b_3D','figspace4c_3D','figspace4d_3D','figspace4e_3D','figspace4f_3D',
            'figspace5a_3D','figspace5ab_3D','figspace5b_3D','figspace5bb_3D','figspace5c_3D','figspace5cb_3D','figspace6_3D',
            'figspacecylinder1_3D','figspacecylinder1b_3D','figspacexy_3D','figspaceyz_3D',
            'figsq_rt_3D','figsq_rt_b_3D','figsurf_rev_intro_3D','figsurf_rev_introb_3D','figsurfrev1a_3D','figsurfrev1b_3D','figsurfrev2a_3D','figsurfrev2b_3D',
            'figvectintro3b_3D','figvvf2_3D',
            'figwash1b_3D','figwash1c_3D','figwash2b_3D','figwash2c_3D','figwash4_3D','figwash4b_3D','figwasher_idea_b_3D','figwasher_idea_c_3D',
            'helicoid','ortho_cyl','ortho_rect','ortho_sph',
            'sph_surf_phi','sph_surf_r','torus']

parser = argparse.ArgumentParser(description='Compile document to a pdf.',
                                 epilog="If no options are given, "
                                 "--help is assumed.")

parser.add_argument("-a","--all", action="store_true",
                    help="Creates all versions. (Ignores other options. 15 min)")

parser.add_argument("-c","--calculus", type=int, choices=[0,1,2,3,4],
                    default=0,
                    help="Calculus semester 1, 2, 3, or (default) all. (2 or 4 min)")

parser.add_argument("-f","--figures", action="store_true",
                    help="Create 3D figures using Asymptote.")

parser.add_argument("-i","--instructor", action="store_true",
                    help="Create instructor solution manual.")

parser.add_argument("-n","--internet", action="store_true",
                    help="Create interNet version (options x & w).")

parser.add_argument("-x","--xml", action="store_true",
                    help="Create xml version. (180 min)");

parser.add_argument("-w","--web", action="store_true",
                    help="Convert xml version to html. (5 min)");

parser.add_argument("-t","--todo", action="store_true",
                    help="Update todo lists.");

parser.add_argument("-q","--quit", action="store_true",
                    help="Write options.tex and quit.")

group = parser.add_mutually_exclusive_group()

group.add_argument("-b","--blackwhite", action="store_true",
                   help="Print static graphics in black and white (default is color).")

group.add_argument("-s","--static", action="store_true",
                   help="Print static color graphics (default is interactive).")

for dir in ('ApexPDFs','logs','web'):
    try:
        os.mkdir(dir)
    except OSError:
        pass # the directory already exists

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
            except OSError:
                # file not found
                oldest_bin_time = -float("infinity")
            if ( os.path.getmtime(asyfile+'.asy') < oldest_bin_time ):
                continue
            # -user apexbw=true runs that command in apexconfig.asy
            # using -bw instead causes the figure to be blacked out (?!)
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
    from collections import defaultdict
    output = subprocess.check_output(['grep','todo','-Ir','.'])
    todos = output.decode('utf-8').split("\n")
    todosin = defaultdict(list)
    for todo in todos:
        if re.match('./make.py',todo) or re.match('./todo_',todo) or todo == '' or re.match('./ApexPDFs/versions',todo):
            continue
        if ' Tim ' in todo:
            todosin['tim'].append(todo)
        elif re.search('/0[1-4]',todo) or 'CalculusI.' in todo:
            todosin['calc1'].append(todo)
        elif re.search('/0[5-9]',todo) or 'CalculusII.' in todo:
            todosin['calc2'].append(todo)
        else:
            todosin['calc3'].append(todo)
    for filename,todolist in todosin.items():
        with open('todo_'+filename+'.txt','w') as todofile:
            todofile.write(('\n'.join(todolist)+'\n').encode('utf-8'))
    # and a few manual TeX commands instead of 'todo'
    with open('todo_tex.txt','w') as mystdout:
        for keywd in ('drawexampleline','enlargethispage','pagebreak',
                      'clearpage','cleardoublepage','columnbreak','newpage',
                      'mfigurethree','myincludegraphicsthree','addplot3'):
            mystdout.write('\n\n'+keywd+':\n')
            mystdout.flush()
            try:
                subprocess.check_call(['grep',keywd,'-Irl','--exclude-dir=hidden','exercises'],stdout=mystdout)
            except:
                pass
            try:
                subprocess.check_call(['grep',keywd,'-Irl','--exclude-dir=hidden','text'],stdout=mystdout)
            except:
                pass
        mystdout.write('\n')

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
        #iii = "I"*args.calculus
        newsuffix += "-"+str(args.calculus)
    if args.blackwhite:
        newsuffix += "-bw"
    elif args.static:
        newsuffix += "-color"
    return newsuffix

def fixRefs():
    """
    LaTeXML doesn't have the frefnum for sections and subsections, so that
    autorefs only end up with the number.  We go through and add hte frefnum in.
    We could compile the regular expression in re.search, but
    "The compiled versions of the most recent patterns passed to re.match(),
    re.search() or re.compile() are cached, so programs that use only a few
    regular expressions at a time needn't worry about compiling regular
    expressions."
    """
    with open('calculusRefs.xml') as input, open('calculus.xml','w') as output:
        for line in input:
#            line = line.decode('iso-8859-1').replace(u'\xa0',' ')
            if ( '<section ' in line and ' refnum' in line and ' frefnum' not in line ):
                refnum = re.search(' refnum="(.+?)"',line).group(1)
                line = line.replace('<section ',
                            '<section frefnum="Section {0}" '.format(refnum))
            output.write(line)

def getcommandline(args):
    if args.xml:
        ret = ['latexml','--quiet','--quiet',#'--verbose','--verbose',#
                       '--destination=calculusRefs.xml',
                       '--nocomments',
                       'Calculus']
        if platform.mac_ver()[0] is '':
            return ret
        else:
            return ['caffeinate','-s'] + ret
            # prevent sleeping, if plugged in, until command finished
    if args.web:
        fixRefs()
        shutil.copyfile('web/script.js','script.js')
        shutil.copyfile('web/style.css','style.css')
        return ['latexmlpost','--quiet','--split','--stylesheet=web/apex.xsl',
                    '--destination=web/index.html','--css=style.css',
                    '--javascript=https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js',
                    '--javascript=LaTeXML-maybeMathJax.js',
                    '--javascript=script.js','calculus.xml']
    if args.internet:
        raise "args.internet doesn't need a command line"
    if args.instructor:
        return ['latexmk','-xelatex','Answers']
    return ['latexmk','-xelatex','Calculus']

def minimizePdf(filename):
    """pdfsizeopt forces Python 2 by using the old style print statement.
    It also prints to sys.stderr, which we can intercept using
    "with ... as sys.stderr" and reverting to sys.__stderr__ at the end.
    It also makes several calls to os.system, which prints to stderr in a way
    we can't intercept.  We intercept those calls by redefining os.system to
    use subprocess.check_call."""
    #os.rename(filename,"ApexPDFs/calculusBig.pso.pdf")
    #return
    sys.path[:0] = ['../pdfsizeopt/lib']
    from pdfsizeopt import main
    oldossystem = os.system
    try:
        os.remove('logs/ossystemerr.log')
    except:
        pass
    def ossystem(args):
        with open('logs/ossystemerr.log','a') as mystdout:
            subprocess.check_call(args,stdout=mystdout,stderr=subprocess.STDOUT,shell=True)
    os.system = ossystem
    with open('logs/minimizePdf.log','w') as sys.stderr:
        main.main(['../pdfsizeopt/pdfsizeopt','--use-pngout=no',
                   '--use-jbig2=no','--use-multivalent=no',filename])
    sys.stderr = sys.__stderr__
    os.system = oldossystem

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
    if args.xml or args.instructor:
        compilewith("-qsc0")
    elif args.internet:
        compilewith("-x")
        compilewith("-w")
        return
    runcommands(args,commands)

def runcommands(args,commands):
    newsuffix = getsuffix(args) or 'Big'
    with open('logs/compilation'+newsuffix+'.log','w') as mystdout:
        try:
            commandline = getcommandline(args)
            subprocess.check_call(commandline,stdout=mystdout,stderr=subprocess.STDOUT)
        except:
            time = "{0[0]:02d}:{0[1]:02d}".format(getTime())
            print "At",time,"failing command:",commands
            raise
    time = "{0[0]:02d}:{0[1]:02d}".format(getTime())
    if commands:
        print "Command line:",commands,"finished at",time
    else:
        print "Command line finished at",time
    if args.instructor:
        os.rename('Answers.pdf','ApexPDFs/Answers.pdf')
    elif not args.xml and not args.web:
        os.rename("Calculus.pdf","ApexPDFs/calculus"+newsuffix+".pdf")
        if newsuffix == 'Big':
            if (2, 4) <= sys.version_info[:2] < (3, 0):
                minimizePdf("ApexPDFs/calculusBig.pdf")
                print "Minimizing pdf finished at","{0[0]:02d}:{0[1]:02d}".format(getTime())
                os.rename("ApexPDFs/calculusBig.pso.pdf","ApexPDFs/calculus.pdf")
            else:
                os.rename("ApexPDFs/calculusBig.pdf","ApexPDFs/calculus.pdf")

if args.all:
    compilewith('-f')
    # having this first makes sure the index and toc are up to date
    compilewith('-c0')
    compilewith('-i')
    for part,size in itertools.product('123',["s","b"]):
        compilewith('-'+size+'c'+part)
else:
    compilewith()

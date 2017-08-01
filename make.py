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
            'ex_helix_y','ex_helix_z','ex_tilted_circle','ex_wobbly_circle',
            'helicoid','ortho_cyl','ortho_rect','ortho_sph',
            'sph_surf_phi','sph_surf_r','torus'
]

fig3Dasyfiles = ['13_05_ex_05','13_05_ex_06','13_05_ex_07','13_05_ex_08','3d_proj','3d_projb',
                 'arc4','arc4_b',
                 'cartcoord1','cartcoord2','conopt1','conopt1c','conopt2','curvature4',
                 'direct1','direct2','direct2b','direct3','direct9','disk1','disk1a','disk1b','disk2a','dotp3','dotp4b','dotp4c','dotpangle3D',
                 'gabriel',
                 'levelcurve1','levelcurve2','lines_dist2','lines_intro','lines1','lines2','lines3','lines6',
                 'mass2','mass3a','mass3b','mchain_intro','mchain2','motion6',
                 'parcalc8','planes_dist','planes_intro','planes1','planes2','planes3','planes4','planes5','polcalc8a',
                 'sa1','sa2a','sa2b',
                 'sq_rt','sq_rt_b','surf_rev_intro','surf_rev_introb','surfrev1a','surfrev1b','surfrev2a','surfrev2b',
                 'tannorm1','tannorm3','tpl2','tpl3','tpl5','tpl6','tpl8',
                 'vectintro3b','vvfderiv1','vvf2','vvflimit4'
]

fig3Dasyfiles += ['10_01_ex_'+str(exnum) for exnum in range(15,29)]
fig3Dasyfiles += ['13_06_ex_'+"{:02}".format(exnum) for exnum in range(7,15)]
fig3Dasyfiles += ['cross'+suffix for suffix in ('_area1','_area1a','1','p_rhr','p4a','p6','pparallelpiped')]
fig3Dasyfiles += ['double'+suffix for suffix in ('_intro2','_intro3','_summary','1','2','3','4','6b','pol1','pol2b','pol4','pol5',)]
fig3Dasyfiles += ['multi'+suffix for suffix in ('_extreme1','_extreme2','_extreme3','_extreme5','cont1','graph_intro','graph_introb','limit_def')]
fig3Dasyfiles += ['partial'+suffix for suffix in ('intro','introb','3a','3b','4a','4b','6','6b')]
fig3Dasyfiles += ['quadric'+suffix for suffix in ('_cone','_coneb','_conec','_ellipsoid','_ellipsoidb',
    '_hyp_one_sheet','_hyp_one_sheetb','_hyp_par','_hyp_parb','_hyp_parc',
    '_hyp_two_sheet','_hyp_two_sheetb','_par','_parb')]
fig3Dasyfiles += ['shell'+suffix for suffix in ('_intro_a','_intro_d','2b','2c','3b','3c','parab_b','parab_b')]
fig3Dasyfiles += ['space'+suffix for suffix in ('_tangent_intro','1','2','3','4a','4b','4c','4d','4e','4f',
        '5a','5ab','5b','5bb','5c','5cb','6','cylinder1','cylinder1b','xy','xz','yz')]
fig3Dasyfiles += ['surfacearea'+suffix for suffix in ('_intro1','_intro2','1','3','4')]
fig3Dasyfiles += ['trip'+suffix for suffix in ('1','1b','2','2b','2c','2d','3','3b','3c','3d','4','4b','4c','4d','5','5b','5c','5d','5e','intro','introa')]
fig3Dasyfiles += ['wash'+suffix for suffix in ('1b','1c','2b','2c','4','4b','er_idea_b','er_idea_c')]

asyfiles += ['fig'+file+'_3D' for file in fig3Dasyfiles]

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

for dir in ('ApexPDFs','logs','todo','web'):
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
    output = subprocess.check_output(['grep','todo','-I','--recursive','--line-number','--exclude-dir=ApexPDFs','--exclude-dir=.git','--exclude-dir=todo','.'])
    todos = output.decode('utf-8').split("\n")
    todosin = defaultdict(list)
    for todo in todos:
        if re.match('./make.py',todo) or todo == '':
            continue
        if ' Tim ' in todo:
            key = 'tim'
        elif re.match('\S*/0[1-4]',todo) or 'CalculusI.' in todo:
            key = 'calc1'
        elif re.match('\S*/0[5-9]',todo) or 'CalculusII.' in todo:
            key = 'calc2'
        elif re.match('\S*/1[0-4]',todo) or 'CalculusIII.' in todo:
            key = 'calc3'
        else:
            key = 'tim'
        todo = re.sub(r'^\./(\S+):(\d+):\s*%?\s*',r'* [\1 line \2](../\1#L\2): ',todo)
        todosin[key].append(todo)
    for filename,todolist in todosin.items():
        with open('todo/todo_'+filename+'.md','w') as todofile:
            todofile.write(('\n'.join(todolist)+'\n').encode('utf-8'))
    # and a few manual TeX commands instead of 'todo'
    with open('todo/todo_tex.txt','w') as mystdout:
        for keywd in ('drawexampleline','enlargethispage','pagebreak','blue',
                      'clearpage','cleardoublepage','columnbreak','newpage',
                      'mfigure','myincludegraphics','addplot3'):
            grepcall = ['grep',keywd,'-I','--recursive','--files-with-matches','--exclude-dir=hidden']
            mystdout.write('\n\n'+keywd+':\n')
            mystdout.flush()
            try:
                subprocess.check_call(grepcall+['exercises'],stdout=mystdout)
            except:
                pass
            try:
                subprocess.check_call(grepcall+['text'],stdout=mystdout)
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
        return ['latexmlpost','--split','--stylesheet=web/apex.xsl',#'--quiet',
                    '--destination=web/index.html','--css=style.css',
                    '--xsltparam=USE_TWOCOLUMN_INDEX',
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
    # having '123' first means that doesn't change everytime, which speed compilation
    for part,size in itertools.product('123',["s","b"]):
        compilewith('-'+size+'c'+part)
else:
    compilewith()

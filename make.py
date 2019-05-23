#!/usr/bin/python

'''
    pdfsizeopt must use Python 2 because it uses old style print statements.
    This file should be version agnostic.  We generally have
    print(string,'')
    In Python 3, this prints the string and then an empty string.
    In Python 2, this prints the tuple that consists of the string and then
    the empty string.
    A different approach would be to use bash to invoke pdfsizeopt
    via Python 2 (I think)
'''

import re
import os
import sys
import glob
import time
import atexit
import shutil
import argparse
import platform
import itertools
import subprocess
from collections import defaultdict, namedtuple

loginfo = []

@atexit.register
def printlogino():
    if loginfo:
        print('\n'.join(loginfo),'')

start = time.time()

parser = argparse.ArgumentParser(description='Compile document to a pdf.',
                                 epilog='If no options are given, '
                                 '--help is assumed.')

def addboolarg(key,help,parser=parser,shortkey=None):
    shortkey = shortkey or key[0]
    parser.add_argument('-'+shortkey,'--'+key,action='store_true',help=help)

addboolarg('all','Creates all versions. (Ignores other options. 20 min)')

parser.add_argument('-c','--calculus', type=int, choices=[0,1,2,3,4],
                    default=0,
                    help='Calculus semester 1, 2, 3, or (default) all. (5 or 8 min)')

addboolarg('figures','Create 3D figures using Asymptote.')
addboolarg('matrices','Create matrix figures for LaTeXML.')
addboolarg('prc','Update 3D html.')
addboolarg('instructor','Create instructor solution manual.')
addboolarg('internet','Create interNet version (options x & w).',shortkey='n')
addboolarg('xml','Create xml version. (2 or 5 hours)'); # 120, 90, 107
addboolarg('web','Convert xml version to html. (5 min)');
parser.add_argument('--standalonen',action='store_true',
                    help='Create interNet version for standalone.tex')
parser.add_argument('--standalonex',action='store_true',
                    help='Create xml version for standalone.tex')
parser.add_argument('--standalonew',action='store_true',
                    help='Convert xml version to html for standalone.tex')
addboolarg('todo','Update todo lists.');
addboolarg('quit','Write options.tex and quit.')

group = parser.add_mutually_exclusive_group()
addboolarg('blackwhite','Print static graphics in black and white (default is color).',parser=group)
addboolarg('static','Print static color graphics (default is interactive).',parser=group)

if len(sys.argv)==1:
    parser.print_help()
    exit()

for dir in ('ApexPDFs','logs','prc','todo','web'):
    try:
        os.mkdir(dir)
    except OSError:
        pass # the directory already exists

args = parser.parse_args()

def getTime():
    end = time.time()
    seconds = int(end-start)
    return (seconds//60,seconds%60)

def makematrices():
    try:
        os.chdir('figures/matrices')
        for srcfile in glob.glob('*Src.tex'):
            root = srcfile.replace('Src.tex','')
            try:
                if os.path.getmtime(srcfile) < os.path.getmtime(root+'.pdf') :
                    continue
            except:
                pass
            with open('../../logs/compilationmatrix.log','w+') as mystdout:
                subprocess.check_call(['xelatex','-synctex=0','-jobname='+root,'matrix'],
                                      stdout=mystdout,stderr=subprocess.STDOUT)
    finally:
        os.chdir('../../')

def makefigs():
    try:
        os.chdir('figures')
        for asyfile in glob.glob('*.asy'):
            if 'config' in asyfile:
                continue
            asyfile = asyfile[:-4]
            extops = {
                #'.pdf':   ['-noprc','-outformat','pdf'],
                '.prc':   ['-prc','-outformat','prc'],
                # -user apexbw=true runs that command in apexconfig.asy
                # using -bw instead causes the figure to be blacked out (?!)
                #'BW.pdf': ['-noprc','-user','apexbw=true','-outname',asyfile+'BW','-outformat','pdf'],
                'BW.png': ['-noprc','-user','apexbw=true','-outname',asyfile+'BW','-outformat','png'],#['-render','4'],
                '.png':   ['-noprc','-outformat','png'],#['-render','4'],
            # for some reason, -render kills the png output
            }
            asyexe = '/usr/local/bin/asy'
            # version 2.44 has problems with the png
            # * it doesn't look as nice
            # * -render 4 causes the compilation to fail (https://github.com/vectorgraphics/asymptote/issues/96)
            # * the z-index is based on when they appear in the file, not the camera view
            for ext,opt in extops.items():
                try:
                    if os.path.getmtime(asyfile+ext) <= os.path.getmtime(asyfile+'.asy'):
                        subprocess.check_call([asyexe]+opt+[asyfile])
                except OSError:
                    subprocess.check_call([asyexe]+opt+[asyfile])
        for outfile in glob.iglob('*.out'):
            if ( os.path.getsize(outfile) == 0 ):
                os.remove(outfile)
    finally:
        os.chdir('..')

Figure = namedtuple('Figure',['num','file'])

def updateprc():
    prcdict = prcfromfile('Calculus.aux')
    with open('prc/index.html','w+') as prchtml:
        prchtml.write('<!doctype html>\n'
                      '<html>\n'
                      '<head>\n'
                      '<meta charset="utf-8">\n'
                      '<title>3d images</title>\n'
                      '<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">\n'
                      '<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>\n'
                      '<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>\n'
                      '<style>.box{display:inline-block;text-align:center;margin:1em}img{width:2in;}</style>\n'
                      '</head>\n'
                      '<body>\n'
                      '<h1>3d Images From APEX Calculus LT</h1>\n'
                      '<div id="accordion">\n')
        # sorting 'A' to the end and continuing seems redundant. 
        chapters = sorted( prcdict.keys() , key=lambda x:float('inf') if x=='A' else int(x) )
        for chapter in chapters:
            if chapter=='A':
                continue
            writechapterprc(prcdict,prchtml,chapter)
        writechapterprc(prcdict,prchtml,'A')
        prchtml.write('</div>\n')
        prchtml.write('</div>\n'
                      '<p>\n'
                      'The linked prc files can be viewed with Adobe Acrobat Pro.<br>\n'
                      'The mobile app &ldquo;3D PDF Reader&rdquo; by Tech Soft 3D for '
                      '<a href="https://play.google.com/store/apps/details?id=com.techsoft3d.hps.pdf.reader">Android</a> or '
                      '<a href="https://itunes.apple.com/us/app/3d-pdf-reader/id569307672?mt=8">iOS</a>'
                      ' can also view prc files.\n'
                      '</p>\n'
                      '<script>$("#accordion").accordion({collapsible:true,active:false,heightStyle:"content"});</script>\n'
                      '</body>\n'
                      '</html>\n')

def writechapterprc(prcdict,prchtml,chapter):
    # solutions are recorded differently in the aux as well as the dict
    if chapter=='A':
        prchtml.write('<h3>Solutions<h3>\n')
    else:
        prchtml.write('<h3>Chapter '+str(chapter)+'</h3>\n')
    prchtml.write('<div>\n')
    sections = sorted( prcdict[chapter].keys() )
    for section in sections:
        if chapter=='A':
            # section is really chapter because of \prc@section@autoref in style file
            prchtml.write('<h4>Chapter '+section+'</h4><div>\n')
        else:
            prchtml.write('<h4>Section {}.{}</h4>'.format(chapter,section)+'<div>\n')
        for figure in prcdict[chapter][section]:
            prchtml.write('<div class="box"><a href="{0.file}.prc"><img src="{0.file}.png"><br>{0.num}</a></div>\n'.format(figure))
            shutil.copy('figures/'+figure.file+'.prc','prc')
            shutil.copy('figures/'+figure.file+'.png','prc')
        prchtml.write('</div>\n')
    prchtml.write('</div>\n')

def prcfromfile(filename):
    with open(filename) as filein:
        print('opening',filename)
        prcdict = defaultdict(lambda:defaultdict(list))
        for line in filein:
            if line.startswith(r'\@input{'):
                prcdict.update(prcfromfile(line[len('\@input{'):-2]))
            if line.startswith('% prc '):
                match = re.match('% prc file figures/(\S+) used in Section (A|\d+).(\d+) as ((Figure )?[.#\d+]+)\s*$',line)
                # in Python 3.4+, this would be fullmatch
                if match:
                    prcdict[ match.group(2) ][ match.group(3) ].append(Figure(match.group(4),match.group(1)))
                else:
                    print('no match',line)
        return prcdict

def updatetodo():
    output = subprocess.check_output(['grep','todo','-I','--recursive','--line-number',
                                      '--exclude-dir=ApexPDFs','--exclude-dir=.git','--exclude-dir=todo',
                                      '--exclude-dir=hidden','--exclude-dir=mecmath','.'])
    todos = output.decode('utf-8').split("\n")
    todos.sort()
    todosin = defaultdict(list)
    for todo in todos:
        if re.match('./make.py',todo) or todo == '' or re.match(r'\S+.log',todo):
            continue
        if ' Tim ' in todo:
            key = 'tim'
        # put the next backwards, so that CalcII-UND gets sorted appropriately 
        elif re.match('\S*/1[0-4]',todo) or 'CalculusIII' in todo:
            key = 'calc3'
        elif re.match('\S*/0[5-9]',todo) or 'CalculusII' in todo:
            key = 'calc2'
        elif re.match('\S*/0[1-4]',todo) or 'CalculusI' in todo:
            key = 'calc1'
        else:
            key = 'tim'
        todo = re.sub(r'^\./(\S+):(\d+):\s*%?\s*',r'1 [\1 line \2](../\1#L\2): ',todo)
        todosin[key].append(todo)
    for filename,todolist in todosin.items():
        with open('todo/todo_'+filename+'.md','w+') as todofile:
            todofile.write(('\n'.join(todolist)+'\n').encode('utf-8'))
    # and a few manual TeX commands instead of 'todo'
    with open('todo/todo_tex.txt','w+') as mystdout:
        for keywd in ('drawexampleline','enlargethispage','blue','pagebreak',
                      'newpage','clearpage','cleardoublepage','columnbreak',
                      'mfigure','myincludegraphics','addplot3','cdots'):
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
    with open('options.tex','w+') as options:
        title = 'Calculus'
        if args.calculus in (1,2,3):
            iii = 'I'*args.calculus
            title += ' '+iii
            options.write(r'\includeonly{Calculus'+iii+"}\n")
        options.write(r'\newcommand{\thetitle}{'+title+"}\n")
        if args.blackwhite:
            options.write('\\printinblackandwhite\n')
            options.write('\\usetwoDgraphics\n')
        elif args.static:
            options.write('\\printincolor\n')
            options.write('\\usetwoDgraphics\n')
        else:
            options.write('\\printincolor\n')
            options.write('\\usethreeDgraphics\n')

def getsuffix(args):
    if args.xml:
        return '_xml'
    elif args.standalonex:
        return '_sxml'
    elif args.web:
        return '_web'
    elif args.standalonew:
        return '_sweb'
    elif args.instructor:
        return '_answers'
    newsuffix = ''
    if args.calculus in (1,2,3):
        #iii = "I"*args.calculus
        newsuffix += '-'+str(args.calculus)
    if args.blackwhite:
        newsuffix += '-bw'
    elif args.static:
        newsuffix += '-color'
    return newsuffix

def getlatexmlbin(exe):
    if platform.mac_ver()[0]:
        return os.path.join('..','LaTeXML','bin',exe)
    if platform.win32_ver()[0]:
        return exe
    
def getlatexmlcommandline(base='Calculus'):
    ret = [getlatexmlbin('latexml'),
           '--quiet',#'--verbose','--verbose',#
           '--destination='+base+'.xml',
           '--nocomments',
           base]
    if platform.mac_ver()[0]:
        return ['caffeinate','-s'] + ret
        # prevent sleeping, if plugged in, until command finished
    if platform.win32_ver()[0]:
        ret[0] += '.bat'
    return ret

def getlatexmlpostcommandline(base='Calculus',destdir='web'):
    #fixRefs()
    #shutil.copyfile('web/script.js','script.js')
    #shutil.copyfile('web/style.css','style.css')
    ret = [getlatexmlbin('latexmlpost'),
           '--split',#'--quiet',
           #'--stylesheet=web/apex.xsl',
           '--destination='+destdir+'/index.html',
           #'--xsltparam=USE_TWOCOLUMN_INDEX:true',
           base+'.xml']
    if platform.win32_ver()[0]:
        ret[0] += '.bat'
    return ret
    
def getcommandline(args):
    if args.xml:
        return getlatexmlcommandline()
    if args.standalonex:
        return getlatexmlcommandline('standalone')
    if args.web:
        return getlatexmlpostcommandline()
    if args.standalonew:
        return getlatexmlpostcommandline('standalone','standaloneweb')
    if args.internet or args.standalonen:
        raise 'args.internet does not need a command line'
    if args.instructor:
        return ['latexmk','-xelatex','Answers']
    return ['latexmk','-xelatex','Calculus']

def minimizePdf(filename):
    '''
        pdfsizeopt forces Python 2 by using the old style print statement.
        It also prints to sys.stderr, which we can intercept using
        "with ... as sys.stderr" and reverting to sys.__stderr__ at the end.
        It also makes several calls to os.system, which prints to stderr in a way
        we can't intercept.  We intercept those calls by redefining os.system to
        use subprocess.check_call.  And even so, some calls get through.
    '''
    if (3, 0) <= sys.version_info[:2]:
        print('python 3 precludes pdfsizeopt','')
        shutil.copy('ApexPDFs/bigpdfs/'+filename,'ApexPDFs/smallpdfs/')
        return
    sys.path[:0] = ['../pdfsizeopt/lib']
    from pdfsizeopt import main
    oldossystem = os.system
    try:
        os.remove('logs/ossystemerr.log')
    except:
        pass
    def ossystem(args):
        with open('logs/ossystemerr.log','a+') as mystdout:
            subprocess.check_call(args,stdout=mystdout,stderr=subprocess.STDOUT,shell=True)
    os.system = ossystem
    with open('logs/minimizePdf.log','w+') as sys.stderr:
        main.main(['../pdfsizeopt/pdfsizeopt','--use-pngout=no',
                   '--use-jbig2=no','--use-multivalent=no',
                   'ApexPDFs/bigpdfs/'+filename,'ApexPDFs/smallpdfs/'+filename])
    sys.stderr = sys.__stderr__
    os.system = oldossystem
    for tmpfile in glob.iglob('ApexPDFs/smallpdfs/psotmp.*.parse.png'):
        os.remove(tmpfile)
    message = 'Minimizing pdf finished at '+"{0[0]:02d}:{0[1]:02d}".format(getTime())
    print(message,'')
    loginfo.append(message)

def compilewith(commands=False):
    if commands:
        args = parser.parse_args([''.join(commands)])
    else:
        args = parser.parse_args()
    if args.figures:
        makefigs()
        return
    if args.matrices:
        makematrices()
        return
    if args.todo:
        updatetodo()
        return
    if args.prc:
        updateprc()
        return
    if args.calculus == 4:
        args.calculus = 0
    writeoptions(args)
    if args.quit:
        return
    if args.instructor:
        compilewith('-qsc0')
    elif args.internet:
        compilewith('-x')
        compilewith('-w')
        return
    elif args.standalonen:
        compilewith('--standalonex')
        compilewith('--standalonew')
        return
    runcommands(args,commands)

def runcommands(args,commands):
    newsuffix = getsuffix(args)
    with open('logs/compilation'+newsuffix+'.log','w+') as mystdout:
        try:
            commandline = getcommandline(args)
            print('commandline is:',commandline)
            subprocess.check_call(commandline,stdout=mystdout,stderr=subprocess.STDOUT)
        except:
            time = "{0[0]:02d}:{0[1]:02d}".format(getTime())
            if commands:
                loginfo.append('At '+time+' failing command: '+commands)
            else:
                loginfo.append('At '+time+' failing command line')
            raise
    time = "{0[0]:02d}:{0[1]:02d}".format(getTime())
    if commands:
        message = 'Command line: '+commands+' finished at '+time
        print(message,'')
        loginfo.append(message)
    else:
        message = 'Command line finished at '+time
        print(message,'')
        loginfo.append(message)
    if args.instructor:
        shutil.copy('Answers.pdf','ApexPDFs/bigpdfs/')
        minimizePdf('Answers.pdf')
    elif not args.xml and not args.web and not args.standalonex and not args.standalonew:
        shutil.copy('Calculus.pdf','ApexPDFs/bigpdfs/calculus'+newsuffix+'.pdf')
        minimizePdf('calculus'+newsuffix+'.pdf')

if args.all:
    compilewith('-f')
    # having this first makes sure the index and toc are up to date
    compilewith('-c0')
    compilewith('-i')
    # having '123' first means that doesn't change everytime, which may speed compilation
    for part,size in itertools.product('123',['s','b']):
        compilewith('-'+size+'c'+part)
else:
    compilewith()

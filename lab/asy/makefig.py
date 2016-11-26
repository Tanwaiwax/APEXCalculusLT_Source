#!/usr/local/bin/python3

import os
import glob
import itertools
import subprocess

asyfiles = ['figarc4_b_3D']

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

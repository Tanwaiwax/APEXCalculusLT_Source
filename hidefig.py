#!/usr/local/bin/python3

import re
import sys
import glob
import shutil

keepers = ('figures/Calculus_figures.pdf','figures/afig_temp.pdf')

search = sys.argv[1] if len(sys.argv)==2 else 'figures'

pdfnames = { x[:-4]
              for x in glob.iglob("figures/*.pdf")
               if 'BW' not in x and '3D' not in x
                and search in x and x not in keepers}

#print('pdfs found:',len(pdfnames))

def removefilesfoundin(fileglob):
    for texfilename in glob.iglob(fileglob):
        with open(texfilename) as texfile:
            content = texfile.read()
            for pdfname in pdfnames.copy():
                if '{'+pdfname+'}' in content:
                    pdfnames.remove(pdfname)

removefilesfoundin('text/*.tex')
removefilesfoundin('exercises/*.tex')

#print('pdfs not used:',len(pdfnames))
#print('random 10:',list(pdfnames)[:10])

removalcandidates = { x.replace('_',''):[] for x in pdfnames }

for filename in glob.iglob('figures/*'):
    newname = filename.replace('_','').replace('BW','').replace('3D','')[:-4]
    if newname in removalcandidates:
        removalcandidates[newname].append(filename)

for key,valarr in removalcandidates.copy().items():
    if not any( '.tex' in val for val in valarr ) or any( '_3D' in val for val in valarr ) or any( '.prc' in val for val in valarr ):
        del removalcandidates[key]

print('ready to remove:',len(removalcandidates))

for valarr in removalcandidates.values():
    for filename in valarr:
        newname = filename.replace('figures/','figures/hidden/')
        shutil.move(filename,newname)

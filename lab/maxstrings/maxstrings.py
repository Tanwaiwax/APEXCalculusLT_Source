
import subprocess

subprocess.check_call(['latexmk','-g','-lualatex','small2e'],stdout=subprocess.DEVNULL)
subprocess.check_call(['grep','strings out of','small2e.log'])
subprocess.check_call(['lualatex','small2e'],stdout=subprocess.DEVNULL)
subprocess.check_call(['grep','strings out of','small2e.log'])
subprocess.check_call(['lualatex','--cnf-line="max_strings=1000000"','small2e'],stdout=subprocess.DEVNULL)
subprocess.check_call(['grep','strings out of','small2e.log'])  # fails
#subprocess.check_call(['max_strings=1000000','latexmk','-g','-lualatex','small2e'],stdout=subprocess.DEVNULL)
#subprocess.check_call(['grep','strings out of','small2e.log'])
# FileNotFoundError: [Errno 2] No such file or directory: 'max_strings=1000000'
#subprocess.check_call(['lualatex','--cnf-line="max_strings=1000000"','small2e'],stdout=subprocess.DEVNULL,shell=True)
#subprocess.check_call(['grep','strings out of','small2e.log'])
# hangs
subprocess.check_call(['lualatex --cnf-line="max_strings=1000000" small2e'],stdout=subprocess.DEVNULL,shell=True)
subprocess.check_call(['grep','strings out of','small2e.log'])  # succeeds
subprocess.check_call(['max_strings=1000000 latexmk -g -lualatex small2e'],stdout=subprocess.DEVNULL,shell=True)
subprocess.check_call(['grep','strings out of','small2e.log'])  # succeeds

# latexmk -max-strings=1000000 -pdf small2e  # fails
'''
This is related to increasing max-strings (see https://tex.stackexchange.com/a/741777/107497).  It appears that the option `-max-strings=n` does not have the expected effect.
`lualatex small2e` and `latexmk small2e` have "460 strings out of 467892" in the log file (or similar numbers).
`lualatex --cnf-line="max_strings=1000000" small2e` has "443 strings out of 970209".
`latexmk --cnf-line="max_strings=1000000" small2e` gives an error "Bad options specified" 
`latexmk -max-strings=1000000 small2e` completes, but used the command
`latex  -max-strings=1000000 -recorder  "/usr/local/texlive/2025/texmf-dist/tex/latex/base/small2e.tex"`
so that the log has "latex: unrecognized option `-max-strings=1000000'" and "466 strings out of 467893"
`max_strings=1000000 latexmk small2e` has "466 strings out of 967893"

`-hash-extra` is similar, which makes me wonder about the other `=n` options.
'''


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

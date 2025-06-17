#!/bin/bash -l
#-----------------------------------
# David Apostal
# UND Computational Research Center
#
# Timothy Prescott
# UND Math Dept
#
# Submit:
#   sbatch this-file.sh
#
# Check status:
#   squeue | grep [userid]
#   squeue -u $USER
#   squeue -j [jobid]
#-----------------------------------

# use
# git pull origin master
# to make sure the code is up to date

#SBATCH --job-name=latex-books
#SBATCH --partition=talon

# Sets the maximum time the job can run (hh:mm:ss).
#SBATCH --time=24:00:00

# Specifies nodes for the job.
#SBATCH --nodes=1

# Sets the output file name. %x = job-name, %j = job-id
#SBATCH --output=./%x.%j.out.txt
#SBATCH --error=./%x.%j.err.txt

# Job events (mail-type): begin, end, fail, all.
#SBATCH --mail-type=all
#SBATCH --mail-user=timothy.prescott@und.edu

# load required modules here
#module load apptainer
# print the loaded modules
#module list

echo ""
echo "Job started at $(date)"
echo ""

source ~/.venv/bin/activate
python3 make.py -bc1
python3 make.py -qbc2
lualatex -interaction=batchmode Calculus
cp Calculus.log logs/compilation-lua.log
grep -l 'Fatal error occurred, no output PDF file produced' Calculus.log
if [ $? ne "0" ]; then
    echo "failed lua"
    exit
fi
python3 make.py -bc1
python3 make.py -qbc2
max_strings=1000000 hash_extra=1000000 latexmk -g -lualatex -interaction=batchmode Calculus
cp Calculus.log logs/compilation-mk.log
grep -l 'Fatal error occurred, no output PDF file produced' Calculus.log
if [ $? ne "0" ]; then
    echo "failed mk"
    exit
fi
python3 make.py -bc1
python3 make.py -bc2
exit_code=$?
deactivate

echo ""
echo "Job finished at $(date)"
echo ""

tar czf talon-logs.tar.gz logs/
cd ApexPDFs
tar czf bigpdfs.tar.gz bigpdfs/

if [ "$exit_code" -ne "0" ]; then
    echo "failed make"
    exit "$exit_code"
fi

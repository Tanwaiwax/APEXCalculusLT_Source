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

#SBATCH --job-name=latexml
#SBATCH --partition=talon

# Sets the maximum time the job can run (hh:mm:ss).
#SBATCH --time=48:00:00

# Specifies nodes for the job.
#SBATCH --nodes=1

# Sets the output file name. %x = job-name, %j = job-id
#SBATCH --output=./%x.%j.out.txt
#SBATCH --error=./%x.%j.err.txt

# Job events (mail-type): begin, end, fail, all.
#SBATCH --mail-type=all
#SBATCH --mail-user=timothy.prescott@und.edu

# load required modules here
module load singularity
# print the loaded modules
#module list

echo ""
echo "Job started at $(date)"
echo ""

export LATEXML_KPSEWHICH=$HOME/.tex/texlive/2021/bin/x86_64-linux/kpsewhich

base="Calculus"
#apexdir="$HOME/git/APEXCalculusLT_Source"
latexmldir="$HOME/.cpan/sources/authors/id/B/BR/BRMILLER/LaTeXML-0.8.6/blib/script"
singularitydir="$HOME/latexml"
printf '\\newcommand{\\thetitle}{Calculus}\n\\printincolor\n\\usethreeDgraphics\n\\renewcommand{\\monthYear}{June 2021}\n' > options.tex

singularity exec $singularitydir/latexml.sif $latexmldir/latexml --quiet --destination=$base.xml --nocomments $base

echo ""
echo "Job intermission at $(date)"
echo ""

singularity exec $singularitydir/latexml.sif $latexmldir/latexmlpost --split --destination=web/index.html $base.xml

echo ""
echo "Job ended at $(date)"
echo ""

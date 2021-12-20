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
latexmlscripts="$HOME/.cpan/sources/authors/id/B/BR/BRMILLER/LaTeXML-0.8.6/blib/script"
singularitydir="$HOME/latexml"
printf '\\newcommand{\\thetitle}{Calculus}\n\\printincolor\n\\usethreeDgraphics\n\\renewcommand{\\monthYear}{June 2021}\n' > options.tex

singularity exec $singularitydir/latexml.sif $latexmlscripts/latexml --quiet --destination=$base.xml --nocomments $base

exit_code=$?

echo ""
echo "latexml finished at $(date)"
echo ""

if [ "$exit_code" -ne "0" ]; then
    echo "latexml failed"
    exit "$exit_code"
fi

singularity exec $singularitydir/latexml.sif $latexmlscripts/latexmlpost --split --destination=web/index.html --quiet $base.xml

exit_code=$?

echo ""
echo "latexmlpost finished at $(date)"
echo ""

if [ "$exit_code" -ne "0" ]; then
    echo "latexmlpost failed"
    exit "$exit_code"
fi

tar czf web.tar.gz web/

singularity exec $singularitydir/latexml.sif $latexmlscripts/latexmlpost --split --destination=epub/index.xhtml --stylesheet=apexepub.xsl $base.xml

exit_code=$?

echo ""
echo "latexmlpost epub finished at $(date)"
echo ""

if [ "$exit_code" -ne "0" ]; then
    echo "latexmlpost epub failed"
    exit "$exit_code"
fi

tar czf epub.tar.gz epub/

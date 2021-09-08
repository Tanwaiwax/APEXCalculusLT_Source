#!/bin/bash -l
#-----------------------------------
# slurm-latexml.sh
#
# David Apostal
# UND Computational Research Center
#
# Submit:
#   sbatch slurm-latexml.sh
#
# Check status:
#   squeue | grep [userid]
#   squeue -u [userid]
#   squeue -j [jobid]
#-----------------------------------

# use
# git pull origin master
# to make sure the code is up to date

#SBATCH --job-name=latexml
#SBATCH --partition=talon

# Sets the maximum time the job can run (hh:mm:ss).
#SBATCH --time=1:00:00

# Specifies nodes for the job.
#SBATCH --nodes=1

# Sets the output file name. %x = job-name, %j = job-id
#SBATCH --output=./%x.%j.out.txt
#SBATCH --error=./%x.%j.err.txt

# Job events (mail-type): begin, end, fail, all.
###SBATCH --mail-type=fail
###SBATCH --mail-user=[userid]@und.edu

# load required modules here
module load singularity
# print the loaded modules
#module list

echo ""
echo "Job started at $(date)"
echo ""

export LATEXML_KPSEWHICH=/home/timothy.prescott/.tex/texlive/2021/bin/x86_64-linux/kpsewhich

#apexdir="../git/APEXCalculusLT_Source"
latexmldir="../../.cpan/sources/authors/id/B/BR/BRMILLER/LaTeXML-0.8.5/blib/script/"
singularitydir="../../latexml"
printf '\\newcommand{\\thetitle}{Calculus}\n\\printincolor\n\\usethreeDgraphics\n\\renewcommand{\\monthYear}{June 2021}\n' > options.tex
singularity exec $singularitydir/latexml.sif $latexmldir/latexml --quiet --destination=standalone.xml --nocomments standalone

echo ""
echo "Job intermission at $(date)"
echo ""

singularity exec $singularitydir/latexml.sif $latexmldir/latexmlpost --split --destination=standaloneweb/index.html standalone.xml

echo ""
echo "Job ended at $(date)"
echo ""

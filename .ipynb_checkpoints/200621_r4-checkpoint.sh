#!/bin/bash

#SBATCH -J 21_r4                         # Job name
#SBATCH -o /scratch/06442/coire/200621/200621_r4.o%j       # Name of stdout output file
#SBATCH -e /scratch/06442/coire/200621/200621_r4.e%j       # Name of stderr error file
#SBATCH -p normal                           # Queue (partition) name
#SBATCH -N 2                                # Total # of nodes
#SBATCH -n 128                               # Total # of mpi tasks (or number of MPI processes)
#SBATCH -t 48:00:00                         # Run time (hh:mm:ss)
#SBATCH --mail-user=cgavinhann@haverford.edu      # E-mail address
#SBATCH --mail-type=all                     # Send email at begin and end of job (none for no emails)
#SBATCH -A TG-MCB180055                     # Allocation name (req'd if you have more than 1)

########### job sript

job=200621
workspace=$SCRATCH/200621
storage=$WORK
cd $workspace/

###### Production MD
gmx convert-tpr -s ${job}_md_4-6ns.tpr -until 8000 -o ${job}_md_6-8ns.tpr
ibrun mdrun_mpi -v -s ${job}_md_6-8ns.tpr -o ${job}_md.trr -cpi state.cpt -cpo state.cpt
cd ..

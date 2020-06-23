#!/bin/bash

#SBATCH -J 21_8n                         # Job name
#SBATCH -o /scratch/06442/coire/200621/200621_8node.o%j       # Name of stdout output file
#SBATCH -e /scratch/06442/coire/200621/200621_8node.e%j       # Name of stderr error file
#SBATCH -p normal                           # Queue (partition) name
#SBATCH -N 8                                # Total # of nodes
#SBATCH -n 512                               # Total # of mpi tasks (or number of MPI processes)
#SBATCH -t 48:00:00                         # Run time (hh:mm:ss)
#SBATCH --mail-user=cgavinhann@haverford.edu      # E-mail address
#SBATCH --mail-type=all                     # Send email at begin and end of job (none for no emails)
#SBATCH -A TG-MCB180055                     # Allocation name (req'd if you have more than 1)

# protein name

protein=200621
job=200621
workspace=$SCRATCH/200621
storage=$WORK
cd $workspace/

########### job sript

###### Production MD
gmx grompp -f ${job}_scale.mdp -c ${job}_npt.gro -p ${job}_topol.top -o ${job}_8node.tpr
ibrun mdrun_mpi -v -s ${job}_8node.tpr -o ${job}_8node.trr -cpo state.cpt
cd ..

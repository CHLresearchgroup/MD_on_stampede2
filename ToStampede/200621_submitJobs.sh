#!/bin/bash
set -x #outputs commands so I can check 
OUT=$(sbatch 200621_r1.sh)
IN=$(python extractJobID.py $OUT)
OUT=$(sbatch --dependency=afterok:$IN 200621_r2.sh)
IN=$(python extractJobID.py $OUT)
OUT=$(sbatch --dependency=afterok:$IN 200621_r3.sh)
IN=$(python extractJobID.py $OUT)
OUT=$(sbatch --dependency=afterok:$IN 200621_r4.sh)
IN=$(python extractJobID.py $OUT)
OUT=$(sbatch --dependency=afterok:$IN 200621_r5.sh)
echo $OUT

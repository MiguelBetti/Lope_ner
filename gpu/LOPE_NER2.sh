#!/bin/env bash

#SBATCH --job-name=LOPE_NER     
#SBATCH --partition=shared-gpu
#SBATCH --time=05:00:00
#SBATCH --mem=24GB
#SBATCH --cpus-per-task=8
#SBATCH --gres=gpu:1,VramPerGpu:24G    
#SBATCH --output=LOPE_NER-%j.out
#SBATCH --error=LOPE_NER-%j.err

module load Python/3.9.6

source /home/users/b/betti/flair-env/bin/activate

/home/users/b/betti/flair-env/bin/python /home/users/b/betti/Lope_ner/NER_LOPE_TRAIN2.py

#!/bin/bash
code_dir="/user/HS500/ct00895/Documents/ai_surrey_codes/codes/nlp-experiments"
/user/HS500/ct00895/Documents/ai_surrey_codes/codes/miniconda3/envs/pytorch/bin/python -u ${code_dir}/tasks/plotmachines/train.py  \
    --experiment_name pmfull_wikiplots_sgpu \
    --accum_iter 40 	\
    --n_batch 4	\
    --p 90 		\
    --num_epochs 10	\
    --use_model plotmachines	\
    --use_neighbor_feat	\
    --use_discourse	\
    --gen_len 922	\
    --max_paragraphs 10	\

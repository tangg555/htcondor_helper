#!/bin/bash
code_dir=" /user/HS500/ct00895/Documents/ai_surrey_codes/codes/nlp-experiments"
/user/HS500/ct00895/Documents/ai_surrey_codes/codes/miniconda3/envs/pytorch/bin/python -u ${code_dir}/tasks/plotmachines/train.py  \
    --experiment_name gptbase_wikiplots \
    --accum_iter 50 	\
    --n_batch 6	\
    --p 90 		\
    --num_epochs 8	\
    --use_model base	\
    --use_neighbor_feat	\
    --use_discourse	\
    --gen_len 922	\
    --max_paragraphs 10	\

PRE_SEQ_LEN=128
LR=2e-2

CUDA_VISIBLE_DEVICES=4 python3 main.py \
    --do_train \
    --train_file RelationExtraction/new_train.json \
    --prompt_column instruction \
    --response_column output \
    --overwrite_cache \
    --model_name_or_path THUDM/chatglm-6b \
    --output_dir output/adgen-chatglm-6b-pt-$PRE_SEQ_LEN-$LR \
    --overwrite_output_dir \
    --max_source_length 480 \
    --max_target_length 210 \
    --per_device_train_batch_size 8 \
    --per_device_eval_batch_size 8 \
    --gradient_accumulation_steps 2 \
    --predict_with_generate \
    --max_steps 10000 \
    --logging_steps 10 \
    --save_steps 1000 \
    --learning_rate $LR \
    --pre_seq_len $PRE_SEQ_LEN \
    --quantization_bit 4

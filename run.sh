#!/bin/bash
# nsys profile --trace=cuda,nvtx,osrt,opengl --backtrace=dwarf --force-overwrite=true -o myprofile bash run.sh

MODE=e2e # benchmark or e2e

if [ $MODE == "benchmark" ]; then
    export MODEL_PATH=./qserve_checkpoints/Llama-3-8B-QServe # Please set the path accordingly
    GLOBAL_BATCH_SIZE=128 \
    python qserve_benchmark.py \
      --model $MODEL_PATH \
      --benchmarking \
      --precision w4a8kv4 \
      --group-size -1
fi

if [ $MODE == "e2e" ]; then
    export MODEL_PATH=./qserve_checkpoints/Llama-3-8B-Instruct-QServe # Please set the path accordingly
    python qserve_e2e_generation.py \
      --model $MODEL_PATH \
      --ifb-mode \
      --precision w4a8kv4 \
      --quant-path $MODEL_PATH \
      --group-size -1
fi

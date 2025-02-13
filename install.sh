git clone https://github.com/mit-han-lab/qserve
cd qserve

conda create -n QServe python=3.10 -y
conda activate QServe
pip install --upgrade pip  # enable PEP 660 support
# This is optional if you prefer to use built-in nvcc
conda install -c nvidia cuda-toolkit -y
# torch==2.3.0
pip install -e .
#pip install llava-torch
pip install flash-attn --no-build-isolation

cd kernel & CUDA_HOME=$HOME/miniconda3/envs/QServe python setup.py install # before torch 2.0.1, there were no ExchangeDevice in CUDAFunctions.h

# git lfs install  # install git lfs if not already
mkdir -p qserve_checkpoints && cd qserve_checkpoints
git clone https://huggingface.co/mit-han-lab/Llama-3-8B-QServe 
git clone https://huggingface.co/mit-han-lab/Llama-3-8B-Instruct-QServe

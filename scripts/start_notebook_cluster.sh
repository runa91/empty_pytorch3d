#!/usr/bin/env bash
source ~/.bashrc

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
PYENV="${SCRIPT_DIR}/../py_env"
source ${PYENV}/bin/activate

CUDNNPATH="/is/software/nvidia/cudnn-7.0-cu9.0/lib64"
export LD_LIBRARY_PATH=${CUDNNPATH}:$LD_LIBRARY_PATH
CUDAPATH="/is/software/nvidia/cuda-9.0/lib64"
export LD_LIBRARY_PATH=${CUDAPATH}:$LD_LIBRARY_PATH

python -m ipykernel install --user --name=py_env

jupyter notebook --no-browser --port=8898 --ip=0.0.0.0

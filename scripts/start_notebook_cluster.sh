#!/usr/bin/env bash

source ~/.bashrc

# --- VERSION 1:
# module load cuda/10.1
# module load cudnn/7.5-cu10.1
# SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
# PYENV="${SCRIPT_DIR}/../py_env_torch"
# source ${PYENV}/bin/activate

# --- VERSION 2:
aenv_torch


python -m ipykernel install --user --name=py_env_torch

jupyter notebook --no-browser --port=8898 --ip=0.0.0.0

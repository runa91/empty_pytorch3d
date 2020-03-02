#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
PYENV="${SCRIPT_DIR}/../py_env_torch"
source ${PYENV}/bin/activate

python -m ipykernel install --user --name='py_env_torch'

jupyter notebook
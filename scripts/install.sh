
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

PROJECT_DIR="${SCRIPT_DIR}/.."

source "${SCRIPT_DIR}/dbash.sh" || exit 1

cd ${SCRIPT_DIR}

PYENV="${SCRIPT_DIR}/../py_env_torch"
if [[ ! -e ${PYENV} ]];then
    dbash::pp "# We setup a virtual environment for this project!"
    if ! dbash::command_exists virtualenv;then
        dbash::pp "# We install virtualenv!"
        sudo pip install virtualenv
    fi
    dbash::pp "Creating python3.8 environment.."
    virtualenv -p python3.7 ${PYENV} --clear
    virtualenv -p python3.7 ${PYENV} --relocatable
fi

#if [[ ! -e ${PYENV} ]];then
#    dbash::pp "# We setup a virtual environment for this project!"
#    if ! dbash::command_exists virtualenv;then
#        dbash::pp "# We install virtualenv!"
#        sudo pip install virtualenv
#    fi
#    dbash::user_confirm ">> Setup python3 environment?" "n"
#    if [[ "y" == "${USER_CONFIRM_RESULT}" ]];then
#        dbash::pp "Creating python3 environment.."
#        virtualenv -p python3 ${PYENV} --clear
#        virtualenv -p python3 ${PYENV} --relocatable
#    else
#        dbash::pp "Creating python2 environment.."
#        virtualenv -p python ${PYENV} --clear
#        virtualenv -p python ${PYENV} --relocatable
#    fi
#fi

source ${PYENV}/bin/activate

dbash::pp "# Should we upgrade all dependencies?"
dbash::user_confirm ">> Update dependencies?" "n"
if [[ "y" == "${USER_CONFIRM_RESULT}" ]];then
    ${PYENV}/bin/pip install --upgrade pip
    ${PYENV}/bin/pip install --upgrade numpy scipy matplotlib joblib ipdb python-gflags google-apputils autopep8 sklearn
    ${PYENV}/bin/pip install --upgrade pandas ipython ipdb jupyter theano opencv-python h5py keras wget jsanimation
    ${PYENV}/bin/pip install --upgrade tqdm imageio scikit-image ipykernel
fi

#dbash::user_confirm ">> Install tensorflow (CPU-only)?" "n"
#if [[ "y" == "${USER_CONFIRM_RESULT}" ]];then
#    ${PYENV}/bin/pip install tensorflow
#fi

#dbash::user_confirm ">> Install tensorflow (GPU)?" "n"
#if [[ "y" == "${USER_CONFIRM_RESULT}" ]];then
#    dbash::pp "Please install cuda 8.0 from nvidia!"
#    dbash::pp "Please install cudnn 5.0 from nvidia!"
#    dbash::pp "Notice, symbolic links for libcudnn.dylib and libcuda.dylib have to be added."
#    ${PYENV}/bin/pip install tensorflow-gpu
#fi

#python setup.py install

# ------- cuda and packages that depend on it
#dbash::user_confirm ">> Do you want to use cuda10 instead of cuda10.1?" "n"
#if [[ "y" == "${USER_CONFIRM_RESULT}" ]];then
if false; then
    dbash::pp "# Load modules: cuda/10.0 and cudnn/7.5-cu10.0 "
    module load cuda/10.0
    module load cudnn/7.5-cu10.0
    dbash::pp "# We install torch-1.4.0 and torchvision-0.5.0"
    ${PYENV}/bin/pip install https://download.pytorch.org/whl/cu100/torch-1.4.0%2Bcu100-cp37-cp37m-linux_x86_64.whl
    ${PYENV}/bin/pip install https://download.pytorch.org/whl/cu100/torchvision-0.5.0%2Bcu100-cp37-cp37m-linux_x86_64.whl
else
    dbash::pp "# Load modules: cuda/10.1 and cudnn/7.5-cu10.1 "
    module load cuda/10.1
    module load cudnn/7.5-cu10.1
    dbash::pp "# We install torch and torchvision"
    ${PYENV}/bin/pip install torch torchvision
fi

dbash::pp "# We install pytorch3d"
# ${PYENV}/bin/pip install pytorch3d
${PYENV}/bin/pip install 'git+https://github.com/facebookresearch/pytorch3d.git'
# cd ${SCRIPT_DIR}/../pytorch3d && ${PYENV}/bin/pip install -e .

python -m ipykernel install --user --name=py_env_torch

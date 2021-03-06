# empty_pytorch3d
Repo containing Python-3.7, CUDA-10.1, cuDNN-7.5 and pytorch3d installation scripts for MPI-IS cluster. 

Clone the repo to your home folder (in my case /lustre/home/nrueegg/):

	cd /lustre/home/nrueegg/
	git clone https://github.com/runa91/empty_pytorch3d  
	(adapted from https://github.com/sergeyprokudin/empty_tensorflow)

To install, run

	bash scripts/install.sh

To use newly created environment, run

	source py_env_torch/bin/activate
	
On the cluster, add the following lines to your ~/.bashrc file or run them before starting the virtual environment:
	
	module load cuda/10.1
	module load cudnn/7.5-cu10.1
	
Most likely the following lines are not needed in the ~/.bashrc file:

	export PATH=${CUDAPATH}/bin:$PATH
	export CPATH=${CUDAPATH}/include:$CPATH
	export LD_LIBRARY_PATH=${CUDNNPATH}/lib64:$LD_LIBRARY_PATH
	export LD_LIBRARY_PATH=${CUDAPATH}/lib64:$LD_LIBRARY_PATH
	export LIBRARY_PATH=${CUDAPATH}/lib64:$LIBRARY_PATH

You might want to add the following to the ~/.bashrc file:

	alias aenv_torch="{ module load cuda/10.1 ; module load cudnn/7.5-cu10.1 ; source ~/empty_pytorch3d/py_env_torch/bin/activate ; }"
	
To run an example job on the cluster:

1.) Interactive job

	condor_submit_bid 300 -i -append request_gpus=1 -append request_memory=30000 -append 'requirements = CUDAGlobalMemoryMb > 10000'
	aenv_torch
	cd /lustre/home/nrueegg/empty_pytorch3d
	python example/torch3d_example.py
	
2.) Non-interactive job

    First, make sure that all paths within example/run_example.sub and example/run_example.sh are correct.

	cd /lustre/home/nrueegg/empty_pytorch3d
	condor_submit_bid 300 example/run_example.sub
	
Python, CUDA and cuDNN versions can be changed. To do so modify scripts/install.sh.


----------------------------------------- NEW -----------------------------------------

1.) smplx installation is added 

-> you need to add the body models manually (as described in https://github.com/vchoutas/smplx)

-> the code will be in /lustre/home/nrueegg/empty_pytorch3d/external_packages/smplx

example usage:

	import smplx
	model = smplx.create('/lustre/home/nrueegg/empty_pytorch3d/external_packages/smplx/models/', gender='neutral', model_type='smpl')

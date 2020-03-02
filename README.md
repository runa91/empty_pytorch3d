# empty_pytorch3d
Repo containing Cuda10.1 and pytorch3d installation scripts for MPI-IS cluster

Clone the repo to your home folder:

	git clone https://github.com/runa91/empty_pytorch3d   
	adapted from https://github.com/sergeyprokudin/empty_tensorflow

To install, run

	bash scripts/install.sh

To use newly created environment, run

	source py_env/bin/activate
	
On the cluster, add the following lines to your ~/.bashrc file:

	export PATH=${CUDAPATH}/bin:$PATH
	export CPATH=${CUDAPATH}/include:$CPATH
	export LD_LIBRARY_PATH=${CUDNNPATH}/lib64:$LD_LIBRARY_PATH
	export LD_LIBRARY_PATH=${CUDAPATH}/lib64:$LD_LIBRARY_PATH
	export LIBRARY_PATH=${CUDAPATH}/lib64:$LIBRARY_PATH
	
	module load cuda/10.1

# empty_tensorflow
Repo containing Tensorflow+Keras installation scripts for MPI-IS cluster

Clone the repo to your home folder:

	git clone https://github.com/sergeyprokudin/empty_tensorflow

To install, run

	bash scripts/install.sh

To use newly created environment, run

	source py_env/bin/activate
	
On the cluster, add the following lines to your ~/.bashrc file:

	export PATH=${CUDAPATH}/bin:$PATH
	export CPATH=${CUDAPATH}/include:$CPATH
	export PATH='/lustre/shared/caffe_shared/cuda_stuff/cudnn-5.1_for_cuda8.0rc/bin':$PATH
	export CPATH='/lustre/shared/caffe_shared/cuda_stuff/cudnn-5.1_for_cuda8.0rc/include':$CPATH
	export LD_LIBRARY_PATH=${CUDNNPATH}/lib64:$LD_LIBRARY_PATH
	export LD_LIBRARY_PATH=${CUDAPATH}/lib64:$LD_LIBRARY_PATH
	export LIBRARY_PATH='/lustre/shared/caffe_shared/cuda_stuff/cudnn-5.1_for_cuda8.0rc/lib64':$LIBRARY_PATH
	export LIBRARY_PATH=${CUDAPATH}/lib64:$LIBRARY_PATH
	
	module load cuda/9.0

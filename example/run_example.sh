#export PATH=${CUDAPATH}/bin:$PATH
#export CPATH=${CUDAPATH}/include:$CPATH
#export PATH='/lustre/shared/caffe_shared/cuda_stuff/cudnn-5.1_for_cuda8.0rc/bin':$PATH
#export CPATH='/lustre/shared/caffe_shared/cuda_stuff/cudnn-5.1_for_cuda8.0rc/include':$CPATH
#export LD_LIBRARY_PATH=${CUDNNPATH}/lib64:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=${CUDAPATH}/lib64:$LD_LIBRARY_PATH
#export LIBRARY_PATH='/lustre/shared/caffe_shared/cuda_stuff/cudnn-5.1_for_cuda8.0rc/lib64':$LIBRARY_PATH
#export LIBRARY_PATH=${CUDAPATH}/lib64:$LIBRARY_PATH
#export PYTHONPATH=/lustre/home/nrueegg/empty_tensorflow/packages/smpl

module load cuda/10.1

cd /lustre/home/nrueegg/empty_pytorch3d/
source py_env_torch/bin/activate
cd /lustre/home/nrueegg/empty_pytorch3d/example/

# ------------------------------------------------------------------

echo -e "start running torch3d_example.py \n" 
python torch3d_example.py
echo -e "finished running torch3d_example.py \n" 

# List of available clusters by default
1. ssh [username]@Beluga.computecanada.ca (Moose have been successfully installed and tested)
2. ssh [username]@graham.computecanada.ca
3. ssh [username]@narval.alliancecan.ca (Moose have been successfully installed and tested)
5. ssh [username]@cedar.computecanada.ca

# How to borrow node for your simulation run
salloc --ntasks-per-node=<> --mem-per-cpu=<>Gb --time=24:0:0

MOOSE_JOBS is a loose influential environment variable that dictates how many cores to use when executing many of our scripts. While operating on INL HPC login nodes alongside everyone else, it is courtesy to limit your CPU core usage. We prefer that users limit themselves to 6:

export MOOSE_JOBS=6

METHODS is an influential environment variable that dictates how to build libMesh. If this variable is not set, libMesh will by default build 4 methods (taking 4x longer to finish). Most of the time, folks will want to use optimized methods:

export METHODS=opt

# HPC_ComputeCanada_Moose
How to install moose framework on ComputeCanada HPC

1. module load StdEnv/2023
2. module load python scipy-stack petsc slepc vtk parmetis wasp eigen boost
3. export CC=mpicc CXX=mpicxx FC=mpif90 F90=mpif90 F77=mpif77
4. Find your desired installation directory (cd projects/def- )
5. export WASP_DIR=$EBROOTWASP
6. export MOOSE_JOBS=6 METHODS=opt
7. git clone --depth 1 --branch 2024-03-08 https://github.com/idaholab/moose.git
8. cd moose
9. git checkout master
10. cd moose/scripts
11. ./update_and_rebuild_libmesh.sh --with-xdr-include=$EBROOTGENTOO/include/tirpc
12. cd ../test
13. make -j6
14. ./run_tests -j6
15. Add lines 1, 2, and 4 to your bashrc profile (nano ~/.bashrc) and source ~/.bashrc to activate the environment correctly. Now, after each restart your libraries will load automatically

# Newer Version of moose
Follow these instructions since the proper wasp version is not installed in moose. You need to install Libmesh and Wasp manually
I tested the installation of Libmesh, Wasp, and PETSc on March 4th, 2025, and worked
First, make sure that no wasp module is called first.
1. module load StdEnv/2023
2. module load python scipy-stack petsc slepc vtk parmetis eigen boost
4. Find your desired installation directory (cd projects/def- )
5. git clone https://github.com/idaholab/moose.git
6. cd moose
7. git checkout master
8. cd moose/scripts
9. ./update_and_rebuild_libmesh.sh --with-xdr-include=$EBROOTGENTOO/include/tirpc
10. ./update_and_rebuild_wasp.sh
11. cd ../test
12. make -j6
13. ./run_tests -j6
14. Add lines 1 and 2 to your bashrc profile (nano ~/.bashrc) and source ~/.bashrc to activate the environment correctly. Now, after each restart, your libraries will load automatically

# How to write a Batch script to submit a job to the queue system on Slurm workload manager (Compute Canada uses Slurm workload manager)
1. Create a new script file
2. Submit the Job to Slurm Queue
  a. sbatch moose_job.sh
3. Check the Job Status
  a. squeue --user=yourusername
4. or check detailed information using:
  a. scontrol show job JOB_ID
5. View Output & Errors
   a. cat moose_output.log
   b. cat moose_error.log



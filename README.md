# List of available clusters by default
1. ssh [username]@Beluga.computecanada.ca (Moose have been successfully installed and tested)
2. ssh [username]@graham.computecanada.ca
3. ssh [username]@narval.alliancecan.ca (Moose have been successfully installed and tested)
5. ssh [username]@cedar.computecanada.ca

# How to borrow node for your simulation run
salloc --ntasks-per-node=<> --mem-per-cpu=<>Gb --time=24:0:0

# How to generate an SSH key pair for connecting to Niagara and mist
1. If you want to use the RSA algorithm
  1. ssh-keygen -t rsa -b 4096 -C "your_email_adress@"
  2. -t rsa: Specifies the type of key to create, in this case, RSA.
  3. -b 4096: Sets the key size to 4096 bits (recommended for stronger security).
2. If you prefer to use ed25519
  1. ssh-keygen -t ed25519 -C "your_email_adress@"  
3. After running the command, it will prompt you to choose a location for saving the key. Press Enter to accept the default location (~/.ssh/id_rsa or ~/.ssh/id_ed25519)
4. You'll also be asked to enter a passphrase (optional but recommended for extra security
5. After generating the key, you'll find your private key in the file ~/.ssh/id_rsa (or ~/.ssh/id_ed25519)
6. The next step would be to install the public part of the key
7. This is done using ssh-copy-id command
8. ssh-copy-id -i /home/saeed/.ssh/id_ed25519.pub <your_user_name>@narval.computecanada.ca

  9. Follow the instructions on https://docs.alliancecan.ca/wiki/SSH_Keys to upload it  

Note:
1. Windows (using Git Bash): If you are using Windows, install Git for Windows, which includes Git Bash, and then use the same command as above to generate your key pair.
# Prerequisite to use moose on Clusters
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

# Newer Version of moose instalation on Niagara
Follow these instructions since the proper wasp version is not installed in moose. You need to install Libmesh and Wasp manually
I tested the installation of Libmesh, Wasp, and PETSc on March 4th, 2025, and worked
First, make sure that no wasp module is called first.
1. #%module load NiaEnv/2022a
2. #%module load python/3.11.5 petsc/3.13.5 vtk/9.0.1 parmetis/4.0.3 eigen/3.4.0 boost/1.78.0
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
2. Submit the Job to Slurm Queue (sbatch moose_job.sh)
3. Check the Job Status (squeue --user=yourusername or squeue -u yourusername)
5. or check detailed information using (scontrol show job JOB_ID)
6. View Output & Errors (cat moose_output.log and cat moose_error.log)

Notes:
1. Check cluster Limits (sinfo -o "%P %c %m %G")
2. You can cancel a job by running (scancel JOB_ID)

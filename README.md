# List of available clusters by default
1. ssh [username]@Beluga.computecanada.ca (Moose have been successfully installed and tested)
2. ssh [username]@graham.computecanada.ca
3. ssh [username]@narval.alliancecan.ca (Moose have been successfully installed and tested)
5. ssh [username]@cedar.computecanada.ca

# How to borrow node for you simulation run
salloc --nodes=<number of nodes needed> --ntasks-per-node=<> --mem-per-cpu=<> --time=24:0:0

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
8. git checkout master
9. cd moose/scripts
10. ./update_and_rebuild_libmesh.sh --with-xdr-include=$EBROOTGENTOO/include/tirpc
11. cd ../test
12. make -j6
13. ./run_tests -j6
14. Add lines 1, 2, and 4 to your bashrc profile (nano ~/.bashrc) and source ~/.bashrc to activate the environment correctly. Now, after each restart your libraries will load automatically

# HPC_ComputeCanada_Moose
How to install moose framework on ComputeCanada HPC

1. module load StdEnv/2023
2. module load python scipy-stack petsc slepc vtk parmetis wasp eigen boost
3. Find your desired installation directory (cd projects/def- )
4. export WASP_DIR=$EBROOTWASP
5. export MOOSE_JOBS=6 METHODS=opt
6. git clone --depth 1 --branch 2024-03-08 https://github.com/idaholab/moose.git
7. cd moose
8. ./update_and_rebuild_libmesh.sh --with-xdr-include=$EBROOTGENTOO/include/tirpc
9. cd ../test
10. make -j6
11. ./run_tests -j6

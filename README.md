# List of available clusters by default
1. ssh <username>@Beluga.computecanada.ca
2. ssh <username>@graham.computecanada.ca
3. ssh <username>@narval.alliancecan.ca (Moose have been successfully installed and tested)
5. ssh <username>@cedar.computecanada.ca

# How to borrow node for you simulation run
salloc --nodes=<number of nodes needed> --ntasks-per-node=<> --mem-per-cpu=<> --time=24:0:0

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
12. Add lines 1, 2, and 4 to your bashrc profile (nano ~/.bashrc) and source ~/.bashrc to activate the environment correctly. Now, after each restart your libraries will load automatically

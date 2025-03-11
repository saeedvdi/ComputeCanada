#!/bin/bash
#SBATCH --job-name=moose_sim        # Name of your job
#SBATCH --account=def-youraccount   # Replace with your Compute Canada account (PI account id should be insertet here)
#SBATCH --time=02:00:00             # Time limit (hh:mm:ss)
#SBATCH --cpus-per-task=8           # Number of CPU cores
#SBATCH --mem=16G                   # Memory allocation
#SBATCH --output=moose_output.log    # Output file
#SBATCH --error=moose_error.log      # Error file

# Load required modules
module load moose

# Navigate to the simulation directory
cd /home/yourusername/moose_project

# Run your MOOSE application (replace `your_moose_exec` with the actual executable)
srun --mpi=pmi2 -n 64 your_moose_exec -i your_input_file.

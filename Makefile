ID := caseID
SESSION := session_name


transferLocalToHPC:
		rsync -avz /home/$USER/pathOnLocal -e ssh --progress  $(ID)@rider.case.edu:/home/$(ID)/pathOnHPC

transferHPCToLocal:
		rsync -arvz -e ssh --progress $(ID)@rider.case.edu:/home/$(ID)/pathOnHPC /home/$USER/pathOnLocal

batchCPU1:
		sbatch job.slurm

batchCPU2:
		sbatch -N 1 -n 6 --mem=16gb  --time=12:00:00 job.slurm


batchCPU1:
		sbatch 

batchGPU1:
		sbatch

batchGPU2:
		sbatch -p gpu -C gpup100 --gres=gpu:2 --exclusive --mem=0 job.slurm

srunCPU1:
		srun --pty /bin/bash

srunCPU2:
		srun -N 1 -n 6 --mem=16gb  --time=12:00:00 --pty /bin/bash

srunGPU1:
		srun -N 1 -n 6 --mem=16gb -p gpu -C gpu2080 --gres=gpu:2  --time=12:00:00 --pty /bin/bash

srunGPU2:
		srun -N 1 -n 6 --mem=16gb -p gpu -C gpu100 --gres=gpu:2  --time=12:00:00 --pty /bin/bash

srunGPUExculive:
		srun -p gpu -C gpup100 --gres=gpu:2 --exclusive --mem=0 --pty /bin/bash 



srunIntractive:
		srun --x11 -N 1 -n 6 --mem=16gb -p gpu -C gpup100 --gres=gpu:1 --time=12:00:00 --pty /bin/bash 

session:
		tmux new -d -s $(SESSION)
		tmux send-keys -t $(SESSION) 'srun -p gpu --gres=gpu:1 -C gpup100 -N 1 -n 1 -c 6 --time=72:00:00 --mem=64gb --pty /bin/bash' C-m
		tmux send-keys -t $(SESSION) './job.slurm' C-m

session-attach:
		tmux attach-session -t $(SESSION)
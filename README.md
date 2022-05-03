# HPC Templates

Templates for sbatch and srun.

Should you have any questions, always feel free to contact [me](mxh1029@case.edu).

| FLAG          | Meaning        | Type                                         | Example           |
| ------------- | -------------- | -------------------------------------------- | ----------------- |
| -p            | Queue type     | gpu, smp                                     | -p gpu            |
| -N            | Node           | Int                                          | -N 1              |
| -n            | Processor      | Int                                          | -n 1              |
| -C            | CPU node       | hex24gb, hex48gb, octa64gb                   | -C hex24gb        |
| -C            | GPU node       | gpup100, gpu2080, gpuk40, gpu4v100, gpu2v100 | -C gpup100        |
| -mem          | Memory         | String                                       | -mem=8gb          |
| --mem-per-cpu | Memory per CPU | String                                       | --mem-per-cpu=6gb |
| --time        | Execution time | Max 320 hrs                                  | --time=10:00:00   |

<!-- | \* | \* | \* | \* | \* | \* | -->

* srun -p gpu -N 1 -n 6 -C gpup100 --gres=gpu:2 --exclusive --mem=0 --pty bash

* srun -p gpu -C gpup100 --gres=gpu:2 --exclusive --mem=0 --pty bash

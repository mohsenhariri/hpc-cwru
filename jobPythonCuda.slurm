#!/bin/bash
# Python virtual environment ✅
# requirements.txt ✅
# GPU ❌

module purge
module load gcc openmpi
module load python/3.8.6
module load cuda/11.2

cp -pR . $PFSDIR
cd $PFSDIR

python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
python app.py
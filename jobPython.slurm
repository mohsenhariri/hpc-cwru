#!/bin/bash
# Python virtual environment ✅
# requirements.txt ✅
# GPU ❌
# This job is useful when running python code with a virtual environment and requirements.txt file.

module purge
module swap intel gcc
module load python/3.8.6

cp -pR . $PFSDIR
cd $PFSDIR

python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
python app.py
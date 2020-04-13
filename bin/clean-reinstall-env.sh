#!/bin/bash

SOURCE="BASH_SOURCE[0]"
SCRIPTDIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

ENV=fastai-course

conda env remove --name $ENV
conda create --name $ENV --file ./conda-package-list.txt

conda activate $ENV
echo "using python $(which python)"


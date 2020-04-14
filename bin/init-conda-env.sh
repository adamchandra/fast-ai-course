#!/bin/bash

host=$(uname -n)

if [[ $host == nimoy* ]]; then
    # Local machine will properly init conda envs
    echo "host is $host (recognized)"

elif [[ $host == blake* ]]; then
    echo "host is $host (recognized)"

    __conda_setup="$('/iesl/canvas/saunders/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/iesl/canvas/saunders/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/iesl/canvas/saunders/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/iesl/canvas/saunders/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup

else
    echo "unrecognized host $host"
fi

pyth=$(which python)
echo "Using python $pyth"

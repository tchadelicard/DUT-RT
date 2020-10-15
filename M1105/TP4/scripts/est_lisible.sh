#!/bin/bash

if [[ -e ${1} && -r ${1} ]]; then
    echo "Le fichier existe bien et vous pouvez le lire !"
    exit 0
else
    echo "Le fichier n'eiste pas ou vous ne pouvez pas le lire !"
    exit 1
fi

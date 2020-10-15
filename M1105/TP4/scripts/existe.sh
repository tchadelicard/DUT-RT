#!/bin/bash

if [[ -d $1 ]]; then
    echo "$(basename $1) est un dossier !"
elif [[ -f $1 ]]; then
    echo "$(basename $1) est un fichier !"
else
    echo "$(basename $1) est autre chose !"
fi

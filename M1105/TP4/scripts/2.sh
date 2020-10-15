#!/bin/bash

if [[ $# -eq 3 ]]; then
    echo "Il y a bien 3 arguments !"
    exit 0
else
   echo "Vous avez mis plus de 3 arguments !"
   exit 1
fi

#!/bin/bash

for file in $@; do
    if [[ -e ${file} && -r ${file} ]]; then
        basename ${file}
        cat ${file}
        echo -e "\n"
    else
        echo -e "Inaccessible\n"
    fi
done

exit 0

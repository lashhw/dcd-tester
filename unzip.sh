#!/bin/bash

DIR="zip"
LOG="${PWD}/log/log.txt"

rm -f "${LOG}"
cd "${DIR}" || exit 1
for dir in *; do (
    {
        cd "${dir}" || exit 1
        echo "=====[${dir}]====="
        unzip -- *.zip
        echo ""
    } >> "${LOG}" 2>&1 
) done

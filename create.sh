#!/usr/bin/env bash

if [ ! $# -eq 1 ] ; then
    echo "error - 1 argument needed: \"DIR_PATH\""
    exit 1
fi

DIR=$1

if [ -e $DIR ] ; then 
    echo "error - Dir already exists: \"${DIR}\""
    exit 2
fi

mkdir -p ${DIR}
echo "Created dir path: \"${DIR}\""

# link to common package
ln -s `pwd`/template/pkg/ ${DIR}/pkg
echo "--- link to custom package ---"

cp -r ./template/acronyms.sty ${DIR}/
echo "--- copied acronyms.sty ---"

cp -r ./template/lecture.sty ${DIR}/
echo "--- copied preamble.sty ---"

cp -r ${DIR}/sections ${DIR}/
echo "--- copied sections dir ---"

cp -r ./template/main.tex ${DIR}/
echo "--- copied main.tex ---"

#!/usr/bin/env bash


if [[ -d $HOME ]] && [[ -w $HOME/test.sh ]];then
    echo "The file exists and you can write to it"
else
    echo "I cannot write to the file"
fi
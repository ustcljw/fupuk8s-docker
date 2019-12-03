#!/bin/bash

this_dir=$(cd $(dirname $0); pwd)
echo ${this_dir}

if [[ $1 == 'delete' ]];then
    rsync -arzP --delete ${this_dir} --exclude=".git" --exclude=".idea" zhuyaguang@fopure00:/data/zhuyaguang/
else
    rsync -arzP ${this_dir} --exclude=".git" --exclude=".idea" zhuyaguang@fopure00:/data/zhuyaguang/
fi
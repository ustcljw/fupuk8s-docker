#!/usr/bin/env bash
# 这个脚本用来单独的启动docker方便测试使用

sudo docker build -t zhuspeech .

isexist=$(sudo docker ps | grep zhuspeech_test )
if [[ ${isexist} != "" ]];then
    echo "停止speech服务"
    sudo docker stop zhuspeech_test
fi

sudo docker rm zhuspeech_test

# sudo docker run -d --name zhuspeech_test zhuspeech
sudo docker run -it --name zhuspeech_test zhuspeech /bin/bash

# sudo docker logs -f zhuspeech_test


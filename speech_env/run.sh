#!/usr/bin/env bash

# 构建镜像
sudo docker build -t registry.cn-hangzhou.aliyuncs.com/fopure_images/speech_env .
sudo docker push registry.cn-hangzhou.aliyuncs.com/fopure_images/speech_env
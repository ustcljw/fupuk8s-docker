#!/bin/bash

# 构建镜像
sudo docker build -t registry.cn-hangzhou.aliyuncs.com/fopure_images/bert-service .
sudo docker push registry.cn-hangzhou.aliyuncs.com/fopure_images/bert-service

# 重启gecmarker
# kubectl get pods -n gecmarker | grep gecmarker | awk '{print $1}' | parallel kubectl delete pod {} -n gecmarker
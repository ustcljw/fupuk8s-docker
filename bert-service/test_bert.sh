# 构建bert镜像服务
docker build -t zhubert .

zhuis=$(docker ps | grep zhubert_test)
[[ $zhuis != "" ]] && docker stop zhubert_test
docker rm zhubert_test

docker run -v /mnt/k8s_nfs/data/dataAmodel/bert-model/uncased_L-12_H-768_A-12:/data/dataAmodel/bert-model/uncased_L-12_H-768_A-12 \
        --name zhubert_test \
        -d \
        zhubert

docker logs -f zhubert_test
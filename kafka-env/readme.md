# k8s kafka安装部署
```bash
# 测试环境直接启动kafka集群
Run kafka & zookeeper

https://github.com/wurstmeister/kafka-docker
sudo docker run -d --net log --name zookeeper --publish 2181:2181 \
        --volume /etc/localtime:/etc/localtime \
        zookeeper:latest

sudo docker run -d --net log --name kafka --publish 9092:9092 \
        --env KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 \
        --env KAFKA_LISTENERS=PLAINTEXT://kafka:9092  \
        --volume /etc/localtime:/etc/localtime \
        wurstmeister/kafka:latest

bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic kafka-test
bin/kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic kafka-test --from-beginning
bin/kafka-console-producer.sh --broker-list kafka:9092 --topic kafka-test
bin/kafka-topics.sh --list --zookeeper zookeeper:2181
```

## 参考文章
- k8s部署kafka:https://blog.csdn.net/luanpeng825485697/article/details/81562755

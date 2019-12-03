# 说明
- 这是一个创建测试环境的k8s服务
- 只使用了Pod + service
- 需要修改elasticsearch的密码
```bash
kubectl apply -f test-ns.yaml
kubectl apply -f test-svc-nodeport.yaml
curl -XPUT -u elastic 'localhost:30002/_xpack/security/user/elastic/_password' -H "Content-Type: application/json" -d '{ "password" : "fupu@elasticsearch_test" }'
```



## 存在的问题
- 没有做成deployment，Pod挂了就没有了，不会自动重启，但是觉得没有必要搞一个deployment
- 没有做资源限制，可以加上
FROM tensorflow/tensorflow:1.12.0-py3

RUN pip install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install bert-serving-server -i https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install bert-serving-client -i https://pypi.tuna.tsinghua.edu.cn/simple

CMD bert-serving-start -num_worker=20 -model_dir /data/dataAmodel/bert-model/uncased_L-12_H-768_A-12

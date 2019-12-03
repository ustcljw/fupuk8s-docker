FROM python

# RUN mv /etc/apt/sources.list /etc/apt/source.list.bak && cat >/etc/apt/sources.list<<EOF

RUN set -ex; \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    g++ git subversion automake libtool zlib1g-dev libboost-all-dev \
    libbz2-dev liblzma-dev python-dev graphviz imagemagick make cmake \
    libgoogle-perftools-dev autoconf doxygen locales swig

#RUN git clone https://github.com/moses-smt/mosesdecoder.git && cd mosesdecoder

ADD mosesdecoder ./mosesdecoder

ENV CPLUS_INCLUDE_PATH="/usr/local/include/python3.7m:$CPLUS_INCLUDE_PATH"

RUN cd mosesdecoder \
        && make -f contrib/Makefiles/install-dependencies.gmake \
        && rm -r build

ENV LD_LIBRARY_PATH=/mosesdecoder/opt/lib:$LD_LIBRARY_PATH

RUN cd mosesdecoder && ./compile.sh --max-kenlm-order=9

ENV MOSES_HOME="/mosesdecoder"
ENV PYTHON_H_DIR="/usr/local/include/python3.7m"


# 设置cmake环境
COPY cmake-3.13.4-Linux-x86_64 ./cmake-3.13.4
ENV PATH="/cmake-3.13.4/bin:$PATH"

# 设置Java环境
COPY jdk-12 ./jdk-12
ENV JAVA_HOME="/jdk-12"
ENV PATH="${JAVA_HOME}/bin:$PATH"

# 设置语言环境
ENV LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
        && locale-gen

CMD ["/mosesdecoder/bin/moses"]

FROM    centos
RUN     yum clean all \
        && yum install -y epel-release && yum -y update \
        && yum -y install libgomp gdb autoconf automake bzip2 cmake expat-devel gcc gcc-c++ git gperf libtool make nasm perl openssl-devel tar swig bison python-devel which zlib-devel golang libcurl-devel openssl-devel protobuf protobuf-devel \
        && yum clean all;

#COPY    soft /soft
RUN     mkdir /soft
COPY    soft/sphinxbase-5prealpha /soft/sphinxbase-5prealpha
RUN     cd /soft/sphinxbase-5prealpha \
        && ./autogen.sh \
        && ./configure --prefix="/soft/sphinxbase-5prealpha/build" \
        && make -j 20 && make install 

COPY    soft/pocketsphinx-5prealpha /soft/pocketsphinx-5prealpha 
RUN     cd /soft/pocketsphinx-5prealpha \
        && ./autogen.sh \
        && ./configure --prefix="/soft/pocketsphinx-5prealpha/build" \
        && make -j 20 && make install

COPY    soft/ffmpeg-4.1.3 /soft/ffmpeg-4.1.3
RUN     cd /soft/ffmpeg-4.1.3 \
        && ./configure --disable-debug --disable-doc --disable-ffplay --enable-shared --enable-avresample --enable-gpl --enable-nonfree --enable-openssl --extra-libs=-lpthread --enable-postproc --enable-small --enable-version3 --extra-libs=-ldl \
        --prefix="/soft/ffmpeg-4.1.3/build" \
        && make -j 20 && make install \
        && hash -r \
        && cd tools \
        && make qt-faststart 
        # && cp qt-faststart /opt/ffmpeg/bin
        # --extra-cflags="-I/opt/ffmpeg/include" \
        # --extra-ldflags="-L/opt/ffmpeg/lib" \

# 设置cmake环境
COPY    soft/cmake-3.13.4-Linux-x86_64 /soft/cmake-3.13.4-Linux-x86_64
ENV     PATH="/soft/cmake-3.13.4-Linux-x86_64/bin:$PATH"

COPY    soft/yaml-cpp /soft/yaml-cpp
RUN     cd /soft/yaml-cpp/ \
        && mkdir build && cd build \
        && cmake -DBUILD_SHARED_LIBS=OFF .. \
        && make -j 20 

COPY    soft/json /soft/json
RUN     cd /soft/json \
        && mkdir build && cd build \
        && cmake .. \
        && make -j 20 
# cmake --build .

COPY    soft/grpc /soft/grpc
RUN     cd /soft/grpc \
        && mkdir build && cd build \
        && cmake .. \
        && make -j 20

COPY    soft/aliyun-oss-cpp-sdk /soft/aliyun-oss-cpp-sdk
RUN     cd /soft/aliyun-oss-cpp-sdk \
        && mkdir build && cd build \
        && cmake .. \
        && make -j 20

COPY    soft/libfvad /soft/libfvad
RUN     cd /soft/libfvad \
        && ./configure \
        && make \
        && make install

COPY    soft/spdlog /soft/spdlog
COPY    soft/boost_1_70_0 /soft/boost_1_70_0
COPY    soft/NlsSdkCpp2.0 /soft/NlsSdkCpp2.0

# ENV LD_LIBRARY_PATH="/opt/ffmpeg/lib:/opt/pocketsphinx/lib:/opt/sphinxbase/lib:$LD_LIBRARY_PATH"
ENV PATH="/soft/ffmpeg-4.1.3:/soft/grpc/build/third_party/protobuf:$PATH"

ENV YAML_DIR="/soft/yaml-cpp" \
    FFMPEG_DIR="/soft/ffmpeg-4.1.3" \
    SPDLOG_DIR="/soft/spdlog" \
    GRPC_DIR="/soft/grpc" \
    JSON_DIR="/soft/json" \
    OSS_DIR="/soft/aliyun-oss-cpp-sdk" \
    SPHINX_BASE_DIR="/soft/sphinxbase-5prealpha" \
    POCKETSPHINX_DIR="/soft/pocketsphinx-5prealpha" \
    BOOST_DIR="/soft/boost_1_70_0" \
    NLSSDK_DIR="/soft/NlsSdkCpp2.0" \
    LIBFVAD_DIR="soft/libfvad"

CMD     ["ffmpeg",  "--help"]

FROM ubuntu:18.04

ADD sources.list /etc/apt/sources.list 

RUN apt-get update && apt-get install -y \
    vim \
    git \
    wget \
    gcc \
    g++ \
    cmake \
    libboost-all-dev \
    libevent-dev \
    libdouble-conversion-dev \
    libgoogle-glog-dev \
    libgflags-dev \
    libiberty-dev \
    liblz4-dev \
    liblzma-dev \
    libsnappy-dev \
    make \
    zlib1g-dev \
    binutils-dev \
    libjemalloc-dev \
    libssl-dev \
    pkg-config \
    libunwind8-dev \
    libelf-dev \
    libdwarf-dev \
    libsodium-dev \
    flex \
    bison

RUN cd / && wget https://github.com/google/googletest/archive/release-1.8.0.tar.gz && \
    tar zxf release-1.8.0.tar.gz && \
    rm -f release-1.8.0.tar.gz && \
    cd googletest-release-1.8.0 && \
    cmake . && make && make install && \
    rm -rf /googletest-release-1.8.0

RUN cd / && git clone https://github.com/facebook/folly.git && \
    mkdir /folly/_build && \
    cd /folly/_build && \
    cmake .. && make -j 56 && make install && \
    rm -rf /folly

RUN cd / && git clone https://github.com/facebookincubator/fizz.git && \
    cd /fizz/fizz/ && \
    cmake . && make -j 56 && make install && \
    rm -rf /fizz

RUN cd / && git clone https://github.com/facebook/wangle.git && \
    cd /wangle/wangle && \
    cmake . && make -j 56 && make install && \
    rm -rf /wangle

RUN cd / && git clone https://github.com/no1msd/mstch.git && \
    cd /mstch && \
    cmake . && make -j 56 && make install && \
    rm -rf /mstch

RUN cd / && git clone https://github.com/facebook/zstd.git && \
    cd /zstd && \
    make -j 56 && make install && \
    rm -rf /zstd

RUN cd / && git clone https://github.com/rsocket/rsocket-cpp.git && \
    mkdir /rsocket-cpp/_build && \
    cd /rsocket-cpp/_build && \
    cmake .. && make -j 56 && make install && \
    rm -rf /rsocket-cpp

RUN cd / && git clone https://github.com/facebook/fbthrift.git && \
    mkdir /fbthrift/_build && \
    cd /fbthrift/_build && \
    cmake .. && make -j 56 && make install && \
    rm -rf /fbthrift/_build




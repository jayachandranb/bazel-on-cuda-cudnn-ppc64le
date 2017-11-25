FROM nvidia/cuda-ppc64le:8.0-cudnn6-devel-ubuntu16.04
LABEL maintainer="Jayachandran B (ANZ Engineering)"

# Install Python 3.5 (and somemore) and make it the default
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
          autoconf \
          build-essential \
          curl \
          gfortran \
          git \
          libatlas-base-dev \
          libblas-dev \
          libcudnn6 \
          libcupti-dev \
          libcurl3-dev \
          libfreetype6-dev \
          libjpeg-dev \
          liblapack-dev \
          libpng-dev\
          libpng12-dev \
          libprotobuf-dev \
          libtool \
          libzmq3-dev \
          nodejs \
          openjdk-8-jdk \
          openjdk-8-jre-headless \
          pkg-config \
          protobuf-compiler \
          python3 \
          python3-dev \
          python3-numpy \
          python3-pip \
          python3-scipy \
          python3-setuptools \
          python3-wheel \
          software-properties-common \
          swig \
          unzip \
          wget \
          zip \
          zlib1g-dev && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /usr/bin/python && \
    rm -f /usr/bin/pydoc && \
    rm -f /usr/bin/pygettext && \
    rm -f /usr/bin/python-config && \
    ln -s /usr/bin/python3.5 /usr/bin/python && \
    ln -s /usr/bin/pydoc3.5 /usr/bin/pydoc && \
    ln -s /usr/bin/pygettext3.5 /usr/bin/pygettext && \
    ln -s /usr/bin/python3.5-config /usr/bin/python-config

RUN pip3 install --no-cache-dir --upgrade pip
RUN cd /opt && \
    wget https://nodejs.org/dist/v8.9.1/node-v8.9.1-linux-ppc64le.tar.xz && \
    tar xpvf node-v8.9.1-linux-ppc64le.tar.xz -C /opt/node && \
    rm -f node-v8.9.1-linux-ppc64le.tar.xz

COPY bazel/bazel /usr/bin/bazel
COPY protobuf /opt/protobuf

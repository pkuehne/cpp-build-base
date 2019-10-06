FROM ubuntu:18.04

# Get g++
RUN apt-get update -q && apt-get install -q -y --no-install-recommends \
    software-properties-common \
    build-essential \
    wget \
    g++ \
    clang

# Install cmake
RUN apt purge --auto-remove cmake
RUN wget https://cmake.org/files/v3.14/cmake-3.14.1.tar.gz
RUN tar -xzvf cmake-3.14.1.tar.gz
WORKDIR ./cmake-3.14.1/
RUN ./bootstrap
RUN make -j4
RUN make install

WORKDIR /workarea

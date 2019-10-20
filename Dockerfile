FROM ubuntu:18.04

# Get g++
RUN apt-get update -q && apt-get install -q -y --no-install-recommends \
    software-properties-common \
    build-essential \
    wget \
    g++ \
    clang

# Install cmake
ARG CMAKE_MAJOR=3
ARG CMAKE_MINOR=15
ARG CMAKE_PATCH=4
ARG CMAKE_VERSION=${CMAKE_MAJOR}.${CMAKE_MINOR}.${CMAKE_PATCH}
RUN apt purge --auto-remove cmake
RUN wget https://cmake.org/files/v${CMAKE_MAJOR}.${CMAKE_MINOR}/cmake-${CMAKE_VERSION}.tar.gz
RUN tar -xzvf cmake-${CMAKE_VERSION}.tar.gz
WORKDIR ./cmake-${CMAKE_VERSION}/
RUN ./bootstrap && make -j4 && make install

WORKDIR /workarea

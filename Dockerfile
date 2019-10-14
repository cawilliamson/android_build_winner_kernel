FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

RUN apt -y update
RUN apt -y dist-upgrade
RUN apt -y install \
  bc \
  build-essential \
  curl \
  git \
  libssl-dev \
  python \
  python-pip \
  python3 \
  wget

RUN pip install gdown

RUN git clone \
  --depth=1 \
  https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 \
  /opt/aarch64-linux-android-4.9

RUN mkdir -p /opt/llvm-arm-toolchain-ship
RUN cd /var/tmp && gdown --id 1XYFR60J5VK7eETXG6ecS7VmVLyW1Q8nG
RUN tar -xvpf /var/tmp/llvm-arm-toolchain-ship.tar.gz -C /opt/llvm-arm-toolchain-ship
RUN rm -f /var/tmp/llvm-arm-toolchain-ship.tar.gz
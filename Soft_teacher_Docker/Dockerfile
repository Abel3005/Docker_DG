FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
WORKDIR /root
COPY ./requirement.txt /
ARG DEBIAN_FRONTEND=noninteractive
ENV TORCH_CUDA_ARCH_LIST="6.0;6.1;6.2;7.0;7.5"
RUN apt update && apt upgrade -y vim git unzip wget && \
    apt install -y --no-install-recommends build-essential cmake python3-tk \pkg-config \
        libjpeg-dev libtiff5-dev libpng-dev \
        libavcodec-dev libavformat-dev libswscale-dev libxvidcore-dev libx264-dev libxine2-dev \
        libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
        libv4l-dev v4l-utils \
        libgtk2.0-dev \
        mesa-utils libgl1-mesa-dri libgtkgl2.0-dev libgtkglext1-dev \
        libatlas-base-dev gfortran libeigen3-dev
RUN apt install -y python2.7-dev python3-dev python-numpy python3-numpy
RUN mkdir opencv
WORKDIR /root/opencv
RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/3.4.2.zip && unzip opencv.zip
RUN wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.4.2.zip && unzip opencv_contrib.zip
WORKDIR /root/opencv/opencv-3.4.2
RUN mkdir build
WORKDIR /root//opencv/opencv-3.4.2/build
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D WITH_TBB=OFF \
    -D WITH_IPP=OFF \
    -D WITH_1394=OFF \
    -D BUILD_WITH_DEBUG_INFO=OFF \
    -D BUILD_DOCS=OFF \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D BUILD_EXAMPLES=OFF \
    -D BUILD_TESTS=OFF \
    -D BUILD_PERF_TESTS=OFF \
    -D WITH_QT=OFF \
    -D WITH_GTK=ON \
    -D WITH_OPENGL=ON \ 
    -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.4.2/modules \
    -D WITH_V4L=ON  \
    -D WITH_FFMPEG=ON \
    -D WITH_XINE=ON \
    -D BUILD_NEW_PYTHON_SUPPORT=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
../
#j[num] num is the number of cpu core
RUN make -j64
RUN make install && ldconfig
RUN apt install -y python3-pip
WORKDIR /root/
RUN pip3 install numpy && pip3 install cython && pip3 install pytest && pip3 install -r /requirement.txt
RUN git clone https://github.com/NVIDIA/apex
RUN git clone https://github.com/hfutcgncas/normalSpeed.git 
RUN git clone https://github.com/pybind/pybind11.git
RUN git clone https://github.com/ethnhe/FFB6D.git 
WORKDIR /root/pybind11
RUN mkdir build
WORKDIR /root/pybind11/build
RUN cmake ../ 
#j[num] num is the number of cpu core
RUN make -j64
RUN make install && ldconfig
WORKDIR  /root/apex
RUN git reset --hard 3fe10b5597ba14a748ebb271a6ab97c09c5701ac
RUN pip3 install -v --disable-pip-version-check --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
WORKDIR  /root/normalSpeed/normalSpeed
RUN python3 setup.py install --user




    











        
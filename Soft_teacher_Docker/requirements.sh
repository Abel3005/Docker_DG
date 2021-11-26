#!bin/bash

cd /root/ws
pip3 install numpy && pip3 install cython && pip3 install -r requirement.txt
cd /root/
git clone https://github.com/NVIDIA/apex
git clone https://github.com/hfutcgncas/normalSpeed.git
git clone https://github.com/pybind/pybind11.git
#

#apex install
cd /root/apex
git reset --hard 3fe10b5597ba14a748ebb271a6ab97c09c5701ac
pip3 install -v --disable-pip-version-check --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
#pybind install
cd /root/pybind11
mkdir build
cd build
cmake ../
make -j8
make install
#normalSpeed
cd /root/normalSpeed/normalSpeed
python3 setup.py install --user
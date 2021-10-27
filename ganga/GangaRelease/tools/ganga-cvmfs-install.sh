#!/bin/bash

cvmfs_server transaction ganga.cern.ch

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cvmfs/sft.cern.ch/lcg/releases/LCG_100/Python/3.8.6/x86_64-centos7-gcc9-opt/lib

cd /cvmfs/ganga.cern.ch/Ganga/install

/cvmfs/sft.cern.ch/lcg/releases/LCG_100/Python/3.8.6/x86_64-centos7-gcc9-opt/bin/python3 -m venv $1

. $1/bin/activate

pip install --upgrade pip setuptools

pip install git+https://github.com/ganga-devs/ganga.git@$1#egg=ganga[LHCb] 

pip install numpy

pip install pandas

deactivate

rm -f /cvmfs/ganga.cern.ch/Ganga/install/LATEST

ln -s /cvmfs/ganga.cern.ch/Ganga/install/$1 /cvmfs/ganga.cern.ch/Ganga/install/LATEST

cd ~

cvmfs_server publish ganga.cern.ch



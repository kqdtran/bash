#!/bin/bash

# Modified from https://github.com/amplab/datascience-sp14/blob/master/setup/setup.bash
# CS 194-16 Introduction to Data Science

# Install python-setuptools and what we need to install these packages from source.
apt-get install -y python-setuptools python-dev python-pip python-matplotlib pandoc

# Install python packages we'll rely on.
pip install numpy
pip install ipython pyzmq jinja2 tornado pygments sphinx
pip install --upgrade ipython

# Install Julia from packages
add-apt-repository -y ppa:staticfloat/julia-deps
add-apt-repository -y ppa:staticfloat/juliareleases
apt-get update # to fetch the julia packages above
apt-get install -y julia

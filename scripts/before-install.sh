#!/usr/bin/env bash
# package update
sudo apt-get update

# install python
sudo apt-get install -y \
    python3 \
    python3-dev \
    python3-pip \
    nginx \
    git \
    supervisor

# remove if already exists
export FOLDER=/home/ubuntu/datamatters

if [ -d ${FOLDER} ]; then
    sudo rm -R ${FOLDER}
    mkdir ${FOLDER}
fi


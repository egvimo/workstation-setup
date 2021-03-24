#!/bin/bash
set -e

sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt install -y python3-pip python3-venv python3-dev libkrb5-dev krb5-user

python3 -m venv .venv --prompt ansible

source .venv/bin/activate

pip3 install -r requirements.txt

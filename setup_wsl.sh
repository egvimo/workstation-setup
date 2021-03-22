#!/bin/sh

sudo apt-get install python3-dev libkrb5-dev krb5-user

python3 -m venv .venv --prompt ansible

source .venv/bin/activate

pip3 install -r requirements.txt

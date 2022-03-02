#!/bin/bash
set -e

sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt install -y pipenv python3-dev libkrb5-dev krb5-user

pipenv install

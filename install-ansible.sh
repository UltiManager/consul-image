#!/bin/bash

# Installs Ansible on the system. Only tested on Ubuntu.

sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible

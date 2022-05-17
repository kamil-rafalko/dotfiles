#!/bin/bash

set -e

if [[ ! -x /usr/bin/ansible ]]; then
  echo "Install Ansible"
  sudo apt update
  sudo apt -y install software-properties-common
  sudo add-apt-repository --yes --update ppa:ansible/ansible
  sudo apt -y install ansible
fi

echo "Run Ansible Playbook"
ansible-playbook ./ansible/dotfiles.yml --ask-become-pass

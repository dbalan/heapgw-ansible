#!/bin/sh
IP=$(terraform output | cut -d '=' -f2 | tr -d ' ')
ssh root@${IP} apt-get -y install python
ansible-playbook -i ${IP}, gateway/gateway.yml



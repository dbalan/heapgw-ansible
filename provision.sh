#!/bin/sh
# apply terraform (set DO_TOKEN)
terraform apply -var=do_token=${DO_TOKEN}

# get floating IP
IP=$(terraform output | cut -d '=' -f2 | tr -d ' ')
ssh root@${IP} apt-get -y install python
ansible-playbook -i ${IP}, gateway/gateway.yml
# manually set the dns if you need to.



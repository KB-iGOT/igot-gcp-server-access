#!/bin/bash

if [[ -z "$@" ]]; then
    echo "Usage: $0 [dev|qa|uat|prod] [noc|devops|engg|sa]" && exit 1
fi
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i "hosts/$1" ansible/users.yml --extra-vars "@users/$2.yml"

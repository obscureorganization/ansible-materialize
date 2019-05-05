#!/usr/bin/env bash

# Use the Unofficial Bash Strict Mode http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

DEBUG=${DEBUG:-false}

# Thanks https://stackoverflow.com/a/17805088
$DEBUG && export PS4='${LINENO}: '
$DEBUG && set -x

yum -q -y install epel-release
yum -q -y install ansible ansible-galaxy git vim-enhanced

cat > /etc/ansible/hosts <<EOF
127.0.0.1
EOF

cat > /root/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxD9RFBP/wFy/M5k+v05QzO2BoZqVYkT6jAD7F2moA7Q9lVa3MrtzIFnHMqeFfpUHKDk2Buhfljf3kz9h/eXlENOlCeCA100mXdp/ZY9ujl5LfeC+BilRvct7+P2fN0RGK7mkZi8/bOukuAngRjHwvuEv48+82XtyBWgS+/lp6ZHOdchkEeLw+CFs8nQa7GmatUDqOSCN4PR7BUE4GrjIjK54Ou3yrQUjpc0BrDBYmfiOVGKm5leP8mqoB7wglMRVyBtp3e52Y2K7LYMjFizzSasMrJ3GnwSInhi6OwXVTxYkqv+YkYYMTGn75/SDMqyQwcXHWtxBaSFL8Jts5uGftZRhP1WTjrSDmllXa+b5N/wHvdlk6QlUd8bwA9js78ycsfVthGk7YB6PbF7YaXG2ZIkxYi6NFbGTKdY+lddgLyzp04SBLr0nIhJDHmB0/UtpZCAPqalqx3sY40pSbc/e7QXkrCFG7ls8lNF7qm1ZeAHC1tF8NIS0tpu24XvUGAD78nqmo3J7L297g5DS0SMV24iWMUOx5JNB5X82CzxIOL8YDeoglEkfj9n+rHnN7TqMwbmCRw2sX+7kpIwVib3oCFAmVo9tASWdN/d+LrFeYSK5M62pvcn7F3cplaZtPhnk5Yjmrzj92purPZYloczCn6B+jS8MeTPbGW5C+Cc1QLQ== rbulling@obscure.org-2017-4096-bit
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAxl7hGuqAlv+SX+0tAFI2fTXU4dMWQrU6fcBVEyzjTDdFQfE3cTVhoRSqjByOmxr5IToNd+MpfR+AenY+KdlCdgw8JmGKao+/ISg9DTxhk9C7cLgpg7GIOa2EcoUMeE/l834zhS6cdZhJiW9zTj4Jbr1QuOzr6gz4FmrBLcAEsskqyD9UEetHNNCDh0166NZ4xIY36v02T3VqS22vMmt69nQKJpcpBWlro9lmy+wb47FwcAgiXsvBSEslEQs/3aF1LI24NtEL/taPDBuCesTDQ77+zDkBqiAcxgjfVqryc9QyGsOsRoAbEWMTPMIm1X456r4DoVdz3F9CK+CNB10ULxXhuqGdbS/T6tSJRik42j7NxhbTeISPUzawY1F5VKWIn+A8x13t4paPLhQOrTKzQDjbqqJtuo2rwV9q+sD/TK0LED1eHPEdKe8FJ3vMM9jKBxHQ4FnPtk09VGF0FoB3SDvKe9HNBr4g7P9ByhWJ+ZDxOQyE90b4YSRT6a0rLD9LjUU+TN36A+gXU+L6Si+zBS85zyXgiCnBK2/HAKKZHmSmlw1Uk7O4logJwj0SpGM/4nDTsepMRbjgTwMho8Kixm/cmdTgReO4jRo6nnwnnyxFFdBatONdBqRQVXqd7NRa0c1Nxvni1cEPESpe5ovJdU09W1Ncpu/0AWaoNs0j2rM= root@tiamat.obscure.org
EOF

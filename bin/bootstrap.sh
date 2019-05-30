#!/usr/bin/env bash

# Use the Unofficial Bash Strict Mode http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

DEBUG=${DEBUG:-false}

# Thanks https://stackoverflow.com/a/17805088
$DEBUG && export PS4='${LINENO}: '
$DEBUG && set -x

# Thanks https://stackoverflow.com/a/246128
DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$DIR/.."

yum -q -y install epel-release
yum -q -y install ansible ansible-galaxy git vim-enhanced

if [[ ! -f /etc/ansible/hosts ]]; then
    cat <<EOF > /etc/ansible/hosts
[local]
localhost              ansible_connection=local
EOF
fi

cat > /root/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxD9RFBP/wFy/M5k+v05QzO2BoZqVYkT6jAD7F2moA7Q9lVa3MrtzIFnHMqeFfpUHKDk2Buhfljf3kz9h/eXlENOlCeCA100mXdp/ZY9ujl5LfeC+BilRvct7+P2fN0RGK7mkZi8/bOukuAngRjHwvuEv48+82XtyBWgS+/lp6ZHOdchkEeLw+CFs8nQa7GmatUDqOSCN4PR7BUE4GrjIjK54Ou3yrQUjpc0BrDBYmfiOVGKm5leP8mqoB7wglMRVyBtp3e52Y2K7LYMjFizzSasMrJ3GnwSInhi6OwXVTxYkqv+YkYYMTGn75/SDMqyQwcXHWtxBaSFL8Jts5uGftZRhP1WTjrSDmllXa+b5N/wHvdlk6QlUd8bwA9js78ycsfVthGk7YB6PbF7YaXG2ZIkxYi6NFbGTKdY+lddgLyzp04SBLr0nIhJDHmB0/UtpZCAPqalqx3sY40pSbc/e7QXkrCFG7ls8lNF7qm1ZeAHC1tF8NIS0tpu24XvUGAD78nqmo3J7L297g5DS0SMV24iWMUOx5JNB5X82CzxIOL8YDeoglEkfj9n+rHnN7TqMwbmCRw2sX+7kpIwVib3oCFAmVo9tASWdN/d+LrFeYSK5M62pvcn7F3cplaZtPhnk5Yjmrzj92purPZYloczCn6B+jS8MeTPbGW5C+Cc1QLQ== rbulling@obscure.org-2017-4096-bit
EOF

ansible-galaxy install -p roles -r "$BASE_DIR/requirements.yml"

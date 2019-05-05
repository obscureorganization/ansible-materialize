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
BASEDIR="$DIR/.."

HOST=localhost
$DEBUG && EXTRA="-vvvv" || EXTRA=""
$DEBUG && ansible -m debug "$HOST" -a "var=hostvars[inventory_hostname]"
ansible-playbook -l "$HOST" "$BASEDIR/local.yml" $EXTRA $*

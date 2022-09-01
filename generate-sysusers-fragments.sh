#!/usr/bin/env bash
#SPDX-License-Identifier: 0BSD

set -euo pipefail

test -f group

mkdir -p sysusers.d

while read -r line; do
  groupname=$(echo "${line}" | cut -d: -f1)
  gid=$(echo "${line}" | cut -d: -f3)
  echo "g ${groupname} ${gid}"
done <group >sysusers.d/20-setup-groups.conf

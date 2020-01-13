#!/bin/bash
set -e -u -o pipefail -x

packages_to_install=(
  apt-transport-https
  ca-certificates
  curl
  ntp
  software-properties-common
)
packages_to_remove=(
  apport
  aptitude
  firewalld
  man-db
  snapd
  ufw
  unattended-upgrades
)

# wait for apt lock
while fuser -s /var/{lib/{dpkg,apt/lists},cache/apt/archives}/lock; do
  sleep 2
done


apt-get update -qq
apt-get install -yq "${packages_to_install[@]}"
apt-get purge -yq "${packages_to_remove[@]}"
apt-get autoremove -yq
apt-get full-upgrade -yq

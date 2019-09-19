#!/bin/sh
# Based on https://github.com/raesene/alpine-containertools/blob/master/entrypoint.sh
# Updated to use `ip addr` instead of ifconfig which kali doesn't have

: ${SSH_USERPASS:=$(dd if=/dev/urandom bs=1 count=15 | base64)}

__create_rundir() {
	mkdir -p /var/run/sshd
}

__create_user() {
  # Create a user to SSH into as.
  echo "root:$SSH_USERPASS" | chpasswd
  echo ssh user password: $SSH_USERPASS
}

__create_hostkeys() {
  yes y | ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
}

__ip_address() {
  IPADDRESS="$(ip addr show eth0 | grep inet | awk '{print $2}' | cut -d/ -f1)"
  echo IP Address: $IPADDRESS
}


# Call all functions
__create_rundir
__create_hostkeys
__create_user
__ip_address

exec /usr/sbin/sshd -D -e "$@"

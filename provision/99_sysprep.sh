#!/bin/bash
set -e -u -o pipefail -x

files_to_remove=(
  # Clear bash history
  /home/*/.bash_history
  /root/.bash_history

  # Clean up SSH
  /home/*/.ssh
  /root/.ssh

  # Reenable cloud-init
  /etc/cloud/cloud-init.disabled

  # Reset Host identity
  /etc/hostid
  /etc/ssh/ssh_host_*
  /var/lib/systemd/random-seed
  /etc/udev/rules.d/70-persistent-net.rules

  # Crash dumps
  /var/spool/abrt

  # Temporary files
  /tmp/*
  /var/tmp/*

  # Logfiles
  /root/anaconda-ks.cfg
  /root/install.log
  /root/install.log.syslog
  /var/cache/fontconfig/*
  /var/cache/apt/*
  /var/cache/gdm/*
  /var/cache/man/*
  /var/lib/apt/lists/*
  /var/lib/AccountService/users/*
  /var/lib/fprint/*
  /var/lib/logrotate.status
  /var/log/*.log*
  /var/log/BackupPC/LOG
  /var/log/apache2/*_log
  /var/log/apache2/*_log-*
  /var/log/audit/*
  /var/log/btmp*
  /var/log/ceph/*.log
  /var/log/chrony/*.log
  /var/log/cron*
  /var/log/cups/*_log
  /var/log/dmesg*
  /var/log/gdm/*
  /var/log/glusterfs/*glusterd.vol.log
  /var/log/glusterfs/glusterfs.log
  /var/log/httpd/*log
  /var/log/jetty/jetty-console.log
  /var/log/lastlog*
  /var/log/libvirt/libvirtd.log
  /var/log/libvirt/lxc/*.log
  /var/log/libvirt/qemu/*.log
  /var/log/libvirt/uml/*.log
  /var/log/mail/*
  /var/log/maillog*
  /var/log/messages*
  /var/log/ntp
  /var/log/ntpstats/*
  /var/log/ppp/connect-errors
  /var/log/sa/*
  /var/log/secure*
  /var/log/setroubleshoot/*.log
  /var/log/spooler*
  /var/log/squid/*.log
  /var/log/tallylog*
  /var/log/unattended-upgrades
  /var/log/wtmp*
  /var/named/data/named.run
)

rm -rfv "${files_to_remove[@]}"

: > /etc/machine-id

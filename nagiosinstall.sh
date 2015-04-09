#!/bin/bash
# Installs Nagios NRPE for Monitor.xtuple.com

installpkg()
{
pkg=nagios-nrpe-server

if apt-get -qq install $pkg; then
    echo "Successfully installed $pkg"
else
    echo "Error installing $pkg"
fi
}

installcfg()
{
cat << EOF >> /etc/nagios/nrpe_local.cfg

### ADDED BY xTuple

allowed_hosts=23.21.178.187,127.0.0.1,monitor.xtuple.com

command[check_users]=/usr/lib/nagios/plugins/check_users -w 5 -c 10
command[check_load]=/usr/lib/nagios/plugins/check_load -w 15,10,5 -c 30,25,20
command[check_all_disks]=/usr/lib/nagios/plugins/check_disk -w 20 -c 10 -p /
command[check_zombie_procs]=/usr/lib/nagios/plugins/check_procs -w 5 -c 10 -s Z
command[check_procs]=/usr/lib/nagios/plugins/check_procs -w 200 -c 250
command[check_swap]=/usr/lib/nagios/plugins/check_swap -w 20 -c 10

EOF
}

restartnag()
{
service nagios-nrpe-server restart
}

installpkg
installcfg
restartnag

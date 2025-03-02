#!/bin/sh

DIR_PATCH=/etc/crontabs/patches

# remove older version of patch
grep -v "/ssh_patch.sh" /etc/crontabs/root > /etc/crontabs/root.new
mv /etc/crontabs/root.new /etc/crontabs/root
/etc/init.d/cron restart

# remove newest version
uci delete firewall.auto_ssh_patch
uci commit firewall

rm -f $DIR_PATCH/ssh_patch.sh
rm -f /tmp/ssh_patch.log


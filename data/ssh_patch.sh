#!/bin/sh

[ -e "/tmp/ssh_patch.log" ] && return 0

if grep -q '= "release"' /etc/init.d/dropbear ; then
	sed -i 's/nvram get ssh_en/echo 1/g' /etc/init.d/dropbear
	sed -i 's/= "release"/= "XXXXXX"/g'  /etc/init.d/dropbear
fi

/etc/init.d/dropbear enable
/etc/init.d/dropbear restart

echo "ssh enabled" > /tmp/ssh_patch.log

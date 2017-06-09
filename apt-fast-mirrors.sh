#!/bin/sh


MIRRORS=$(cat $(find /etc/apt/ -name '*.list') | grep '^deb' | cut -d' ' -f 2 | sort | uniq | tr '\n' ',' | sed 's/,$//' | sed 's/,/, /g')
MIRRORS=$(cat $(find /etc/apt/ -name '*.list') | grep '^deb' | cut -d' ' -f 2 | sort | uniq | awk '{print $0}')
MIRRORS="( $MIRRORS )"
echo MIRRORS=$MIRRORS
exit

write_mirrors(){
cat<<EOF

# MIRRORS-all: every .list under /etc/apt
MIRRORS=$MIRRORS

EOF
}

[ -f /etc/apt-fast.conf ] && write_mirrors >> /etc/apt-fast.conf

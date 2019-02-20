#!/bin/bash

apt-get install xz-utils  -y

# get ltp binary
rm -rf  /opt/ltp-bin2.tar.gz
wget   --no-check-certificate  -O /opt/ltp-bin2.tar.gz   https://fat.nos-eastchina1.126.net/ltp-bin2.tar.gz
cd /opt
tar -xf  /opt/ltp*.tar.xz


# nq to run background
wget  -O /bin/nq  https://fat.nos-eastchina1.126.net/nq
chmod 777 /bin/nq

nq  /root/ltp/testscripts/ltpstress.sh  -d /tmp   -t 1000  -n -p -l /tmp/ltplog.12431



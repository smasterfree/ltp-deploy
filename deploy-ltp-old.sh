#!/bin/bash

apt-get install xz-utils  -y

# get ltp binary
rm -rf  /root/ltp-bin2.tar.gz
wget   --no-check-certificate  -O /root/ltp-bin2.tar.gz   https://fat.nos-eastchina1.126.net/ltp-bin2.tar.gz
cd /root
tar -xf  /root/ltp*.tar.gz


# nq to run background
wget  -O /bin/nq  https://fat.nos-eastchina1.126.net/nq
chmod 777 /bin/nq

cd /root/ltp/testscripts/
nq  ./ltpstress.sh  -d /tmp   -t 1000  -n -p -l /tmp/ltplog.12431


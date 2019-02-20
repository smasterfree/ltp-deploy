#!/bin/bash

apt-get install htop xz-utils  -y

# get ltp binary
rm -rf  /root/ltp-2018.tar.xz
wget   --no-check-certificate  -O /root/ltp-2018.tar.xz   https://fat.nos-eastchina1.126.net/ltp-2018.tar.xz
cd /root
tar -xf  /root/ltp-2018.tar.xz


# nq to run background
wget  -O /bin/nq  https://fat.nos-eastchina1.126.net/nq
chmod 777 /bin/nq

cd /root/ltp/testscripts/
nq  ./ltpstress.sh  -d /tmp   -t 1000  -n -p -l /tmp/ltplog.12431


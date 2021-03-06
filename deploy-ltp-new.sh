#!/bin/bash

apt-get install htop fping supervisor xz-utils  -y

# get ltp binary
rm -rf  ltp-20190115.tar.xz
wget  -O /opt/ltp-20190115.tar.xz https://fat.nos-eastchina1.126.net/ltp-20190115.tar.xz

cd /opt
tar -xf  /opt/ltp*.tar.xz

# skip file 
wget  -O /opt/ltp/skip_file  https://raw.githubusercontent.com/smasterfree/ltp-deploy/master/skip_file

# nq to run background
wget  -O /bin/nq  https://fat.nos-eastchina1.126.net/nq
chmod 777 /bin/nq

nq  /opt/ltp/runltp -c 4 -i 2 -m 2,4,10240,1 -D 2,10,10240,1 -p -q -S /opt/ltp/skip_file  -l /mnt/result-log.27351 -o /mnt/result-output.27351 -C /mnt/result-failed.27351 -d /tmp  -t 30d




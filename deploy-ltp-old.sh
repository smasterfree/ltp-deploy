#!/bin/bash

if [  -n "$(python -mplatform | egrep -i \(debian\|ubuntu\))" ]; then
    apt-get install htop xz-utils  -y 
else
    yum -y install epel-release
    yum install htop xz-utils  -y  
fi



# get ltp binary
rm -rf  /root/ltp-2018.tar.xz
wget   --no-check-certificate  -O /root/ltp-2018.tar.xz   https://fat.nos-eastchina1.126.net/ltp-2018.tar.xz
cd /root
tar -xf  /root/ltp-2018.tar.xz

pkill nq; pkill genload; pkill ltp 

# nq to run background
wget  -O /bin/nq  https://fat.nos-eastchina1.126.net/nq
chmod 777 /bin/nq

cd /root/ltp/testscripts/
rm ,*     # nq files need to be removed
nq  ./ltpstress.sh  -d /mnt   -t 1000  -n -p -l /mnt/ltplog.12431


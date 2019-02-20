#!/bin/bash
apt-get install  htop  fping supervisor xz-utils  -y


# get ltp binary
wget  -O /opt/ltp-20190115.tar.xz https://fat.nos-eastchina1.126.net/ltp-20190115.tar.xz

cd /opt
tar -xf  /opt/ltp*.tar.xz

# skip file 
wget  -O /opt/ltp/skip_file  https://raw.githubusercontent.com/smasterfree/ltp-deploy/master/skip_file

# nq to run background
wget  -O /bin/nq  https://raw.githubusercontent.com/smasterfree/ltp-deploy/master/nq
chmod 777 /bin/nq


nq  /opt/ltp/runltp -c 4 -i 2 -m 2,4,10240,1 -D 2,10,10240,1 -p -q -S /opt/ltp/skip_file  -l /tmp/result-log.27351 -o /tmp/result-output.27351 -C /tmp/result-failed.27351 -d /tmp  -t 30d


#echo " /opt/ltp/runltp -c 4 -i 2 -m 2,4,10240,1 -D 2,10,10240,1 -p -q -S /opt/ltp/skip_file  -l /tmp/result-log.27351 -o /tmp/result-output.27351 -C /tmp/result-failed.27351 -d /tmp  -t 30d "  > /root/ltp.sh

##cat <<EOT >> /etc/supervisor/supervisord.conf
##[program:ltp]
##command=sh /root/ltp.sh
##autorestart=true
##user=root
##EOT

##sleep 3
##supervisorctl reload

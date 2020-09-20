#!/bin/bash 

#
# cryptService
#
/root/scripts/firewall.sh
Xvfb :2 -screen 0 800x600x24 &

#route add 10.24.71.69 default gw 51.210.1.254
#route add 10.24.71.9 default gw 51.210.1.254
#route add 10.24.71.29 default gw 51.210.1.254

# Demarrage des tomcat
#for i in `ls /home/|grep tomcat` ; do user=`echo $i|sed 's/\/home\///g'` ; su - $user -c startup.sh ; done


exit 0

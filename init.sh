#!/bin/bash
echo "begin configing tunnel lol"
./tunstart.sh
./vpn.sh
cd /etc/openvpn/server
/usr/sbin/openvpn --status %t/openvpn-server/status-%i.log --status-version 2 --suppress-timestamps --config server.conf &
service ssh start
sleep 42000

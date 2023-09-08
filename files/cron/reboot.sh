#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/phantom/cron

# Startup programs
dropbear -Rw -p 85 -b /etc/db-issue.net
stunnel /usr/local/etc/stunnel/stunnel.conf
screen -AmdS ohp-dropbear /phantom/websocket/ohpserver -port 3128 -proxy 127.0.0.1:8080 -tunnel 127.0.0.1:85
screen -AmdS ohp-openvpn /phantom/websocket/ohpserver -port 8000 -proxy 127.0.0.1:8080 -tunnel 127.0.0.1:194
screen -AmdS ws-dropbear python2 /phantom/websocket/ws-dropbear.py
screen -AmdS ws-openvpn python2 /phantom/websocket/ws-openvpn.py
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 9999 --max-connections-for-client 9999
screen -AmdS dnstt dnstt-server -udp :5300 -privkey-file /phantom/dnstt/server.key ns-install_domain 127.0.0.1:85
screen -AmdS udp-custom bash -c 'cd /phantom/udp-custom/ && ./udp-custom server -exclude 7300,53,5300,1194,51820'
iptables-restore < /phantom/iptables.rules

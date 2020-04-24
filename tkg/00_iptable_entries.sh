#!/bin/bash
sudo sysctl -w net.ipv4.conf.ens160.route_localnet=1
sudo iptables -t nat -I PREROUTING -p tcp -i ens160 --dport 2345 -j DNAT --to-destination 127.0.0.1:8080
sudo iptables -t nat -A POSTROUTING -j MASQUERADE
netstat -nr
sudo iptables -t nat -L

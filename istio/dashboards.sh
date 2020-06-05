#!/bin/bash
DASHBOARD_IP=192.168.20.6

sudo sysctl -w net.ipv4.conf.ens160.route_localnet=1
sudo iptables -t nat -I PREROUTING -p tcp -i ens160 --dport 30001 -j DNAT --to-destination 127.0.0.1:30001
sudo iptables -t nat -A OUTPUT -o ens160 -p tcp -m tcp --dport 30001 -j DNAT --to-destination 127.0.0.1:30001
#sudo iptables -t nat -I PREROUTING -p tcp -i ens160 --dport 30002 -j DNAT --to-destination 127.0.0.1:30002
#sudo iptables -t nat -A OUTPUT -o ens160 -p tcp -m tcp --dport 30002 -j DNAT --to-destination 127.0.0.1:30002
#sudo iptables -t nat -I PREROUTING -p tcp -i ens160 --dport 30003 -j DNAT --to-destination 127.0.0.1:30003
#sudo iptables -t nat -A OUTPUT -o ens160 -p tcp -m tcp --dport 30003 -j DNAT --to-destination 127.0.0.1:30003
#sudo iptables -t nat -I PREROUTING -p tcp -i ens160 --dport 30004 -j DNAT --to-destination 127.0.0.1:30004
#sudo iptables -t nat -A OUTPUT -o ens160 -p tcp -m tcp --dport 30004 -j DNAT --to-destination 127.0.0.1:30004

sudo iptables -t nat -I PREROUTING -p tcp -i ens160 --dport 30005 -j DNAT --to-destination 127.0.0.1:30005
sudo iptables -t nat -A OUTPUT -o ens160 -p tcp -m tcp --dport 30005 -j DNAT --to-destination 127.0.0.1:30005
sudo iptables -t nat -I PREROUTING -p tcp -i ens160 --dport 30006 -j DNAT --to-destination 127.0.0.1:30006
sudo iptables -t nat -A OUTPUT -o ens160 -p tcp -m tcp --dport 30006 -j DNAT --to-destination 127.0.0.1:30006
sudo iptables -t nat -I PREROUTING -p tcp -i ens160 --dport 30007 -j DNAT --to-destination 127.0.0.1:30007
sudo iptables -t nat -A OUTPUT -o ens160 -p tcp -m tcp --dport 30007 -j DNAT --to-destination 127.0.0.1:30007

istioctl dashboard kiali --address $DASHBOARD_IP -p 30001 & 
istioctl dashboard prometheus --address $DASHBOARD_IP -p 30002 & 
istioctl dashboard jaeger --address $DASHBOARD_IP -p 30003 & 
istioctl dashboard jaeger --address $DASHBOARD_IP -p 30004 & 
istioctl dashboard zipkin --address $DASHBOARD_IP -p 30005 &
#istioctl dashboard controlz --address $DASHBOARD_IP -p 30006 &
#istioctl dashboard envoy --address $DASHBOARD_IP -p 30006 & 
istioctl dashboard grafana --address $DASHBOARD_IP -p 30007 & 

    

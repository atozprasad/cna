SERVER_IP_AND_PORT=192.168.20.6:7777
BROWSER_CLIENT_IP=192.168.20.3
echo "Octant is running at $SERVER_IP_AND_PORT, but connections allowed only from a Browser running at $BROWSER_CLIENT_IP"
echo -e " Change configurations if needed at $0"

sudo iptables -t nat -A OUTPUT -o ens160 -p tcp -m tcp --dport 7777 -j DNAT --to-destination 127.0.0.1:7777
export OCTANT_ACCEPTED_HOSTS=192.168.20.3
octant --listener-addr 192.168.20.6:7777


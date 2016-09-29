#!/bin/bash

set -e

# Prevent clients from communicating with each other (aka. isolate clients)
#iptables -t nat -A POSTROUTING -s 10.99.99.0/24 ! -d 10.99.99.0/24 -j MASQUERADE

#iptables -A FORWARD -s 10.99.99.0/24 -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j TCPMSS --set-mss 1356

# Forward traffic from clients to internet
#iptables -t nat -A POSTROUTING -o enp2s8 -j MASQUERADE

#echo "Successfully set up iptables rules"
echo "NOTE: Did not set up any iptables rules"

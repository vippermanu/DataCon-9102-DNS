#!/bin/sh

tshark -r not_common.pcap -Y "ip.addr in {46.146.152.237 167.8.145.47 168.83.103.255 207.169.77.215 89.89.143.48 5.234.37.13 15.187.78.172 144.75.150.97 112.169.88.66 34.248.80.1 139.33.104.134 44.104.178.105 244.245.153.199 88.156.186.190 232.133.159.108 213.138.78.224 224.204.102.220 195.96.148.131 13.143.16.85 114.33.143.6 33.88.55.242 214.26.39.53}" -T fields -e dns.qry.name | awk -F, '{if(!($1 ~ /^[a-z]{5,11}\.(cc|cn|ws|com|net|org|info|biz)$/)) print "ERROR", $0}' 
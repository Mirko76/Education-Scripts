#!/bin/bash

# How to use: ./network_scan.sh
# chmod +x ./network_scan.sh
# Define the IP Range 192.168.254
# For example: sudo netdiscover -i enp0s3

# Define the network range to scan (change this to match your network)
network="192.168.254"
output_file="active_devices.txt"

# Loop through a range of IP addresses in the network
for i in {1..254}; do
    ip="$network.$i"
    
    # Ping the IP address with a single packet and a short timeout (adjust as needed)
    if ping -c 1 -W 1 "$ip" &>/dev/null; then
        echo "Host $ip is up"
        echo "$ip" >> "$output_file"
    fi
done

echo "Scanning complete. Active devices saved in $output_file"

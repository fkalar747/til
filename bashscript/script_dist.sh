#!/bin/bash


rm -rf "/home/ubuntu/output0"
exec > "/home/ubuntu/output0"

echo '111111' | sudo -S rm -rf /root/genesis.json
echo '111111' | sudo -S mv ~/genesis.json /root/genesis.json
echo '111111' | sudo -S ~/script_received1.sh

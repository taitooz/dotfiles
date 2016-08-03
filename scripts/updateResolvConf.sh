#!/bin/sh
sudo rm /etc/resolv.conf
sudo ln -s /etc/resolvconf/run/resolv.conf /etc/resolv.conf
sudo resolvconf -u
cat /etc/resolv.conf

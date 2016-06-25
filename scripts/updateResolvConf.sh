#!/bin/sh
sudo rm /etc/resolv.confi
sudo ln -s /etc/resolvconf/run/resolv.conf /etc/resolv.conf
sudo resolvconf -u

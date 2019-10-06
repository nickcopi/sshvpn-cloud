#!/bin/bash
ifconfig tun1 up
ifconfig tun1 10.13.37.2 netmask 255.255.255.252
ip route del default
ip route add default via 10.13.37.1

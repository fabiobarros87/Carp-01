#!/bin/bash

# Ubuntu 16.04.3

# Host 01

apt-get install ucarp

echo 'auto lo
iface lo inet loopback

auto ens32
iface ens32 inet static
        address 192.168.1.10
        netmask 255.255.255.0
        network 192.168.1.0
        broadcast 192.168.1.255
        gateway 192.168.1.254
        # dns-* options are implemented by the resolvconf package, if installed
        dns-nameservers 8.8.8.8

# UCARP
        ucarp-vid 1
        ucarp-vip 192.168.1.100
        ucarp-password passwordunico

iface ens32:ucarp inet static
        address 192.168.1.100
        netmask 255.255.255.0' > /etc/network/interfaces
        
/etc/init.d/networking restart


# Host 02

apt-get install ucarp

echo 'auto lo
iface lo inet loopback

auto ens32
iface ens32 inet static
        address 192.168.1.20
        netmask 255.255.255.0
        network 192.168.1.0
        broadcast 192.168.1.255
        gateway 192.168.1.254
        # dns-* options are implemented by the resolvconf package, if installed
        dns-nameservers 8.8.8.8

# UCARP
        ucarp-vid 2
        ucarp-vip 192.168.1.100
        ucarp-password passworddiferente

iface ens32:ucarp inet static
        address 192.168.1.100
        netmask 255.255.255.0' > /etc/network/interfaces

/etc/init.d/networking restart

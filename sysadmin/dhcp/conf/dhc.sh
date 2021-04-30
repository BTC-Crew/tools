#!/bin/bash

apt purge isc-dhcp-server -y
apt autoremove -y
apt install isc-dhcp-server -y
clear




read -p "       masukan nama interface anda = " int;
echo 'INTERFACESv4="'$int'"' >> /etc/default/isc-dhcp-server



read -p "       masukan subnet anda  = " subnet;
read -p "       masukan netmask anda = " mask;


echo '# A slightly different configuration for an internal subnet.' >> /etc/dhcp/dhcpd.conf
echo 'subnet '$subnet' netmask '$mask ' {' >> /etc/dhcp/dhcpd.conf


read -p "  masukan range ip(10.5.5.26 10.5.5.30) = " range; 
echo 'range '$range';' >> /etc/dhcp/dhcpd.conf

read -p "  masukan alokasi dns server = " dns;
echo 'option domain-name-servers '$dns';' >> /etc/dhcp/dhcpd.conf


read -p "  masukan gateway anda = " gt;
echo 'option routers '$gt';' >> /etc/dhcp/dhcpd.conf



read -p "  masukan broadcast ip anda = " bc;
echo 'option broadcast-address '$bc';' >> /etc/dhcp/dhcpd.conf



read -p "  masukan default lease time anda = " dlt;
echo 'default-lease-time '$dlt';' >> /etc/dhcp/dhcpd.conf



read -p "  masukan maximal lease time anda = " mlt;
echo 'max-lease-time '$mlt';' >> /etc/dhcp/dhcpd.conf


echo '}' >> /etc/dhcp/dhcpd.conf

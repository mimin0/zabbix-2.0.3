#!/bin/bash

DBuser=$(root)
DBpass=$(gsdysx)

set -x

sudo apt-get update
apt-get install mc apache2 mysql-server php5 php5-gd php5-mysql -y
aptitude install build-essential checkinstall libmysqlclient-dev libcurl4-openssl-dev libsnmp-dev libopenipmi-dev libiksemel-dev -y

echo 'Download zabbix 2\n'
wget http://downloads.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/2.0.3/zabbix-2.0.3.tar.gz
mkdir /zabbix
tar -zxf zabbi*.tar.gz
rm zabbix*.tar.gz
cd zabbi*/
mv * /zabbix
cd ./..
rm -rf /zabbi*
cd /zabbix

shell> mysql -u$DBuser -p$DBpass
#mysql> create database zabbix character set utf8;
#mysql> quit;
#mysql -u -p zabbix < database/mysql/schema.sql
## stop here if you are creating database for Zabbix proxy
#mysql -u -p zabbix < database/mysql/images.sql
#mysql -u -p zabbix < database/mysql/data.sql

##configuration server zabbix
#./configure --enable-server --enable-agent --with-mysql --enable-ipv6 --with-net-snmp --with-libcurl --with-openipmi --with-jabber

##configuration agent zabbix
#./configure --enable-agent --enable-static 

#make install

##make web interface
#cd /zabbix/frontends/php 
#cp -a . /var/www

#cd /zabbix/misc/init.d/debian
#cp -a . /etc/init.d/

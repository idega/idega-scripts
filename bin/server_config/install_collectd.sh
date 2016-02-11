#!/bin/bash

echo "#########################################################################"
echo "# A script to install Collect daemon                                    #"
echo "# By Martynas Stakė (martynas@idega.is) 2015                            #"
echo "#########################################################################"
echo "\n"

# Installing Collect daemon
sudo yum -y install collectd collectd-rrdtool rrdtool rrdtool-devel rrdtool-perl perl-HTML-Parser perl-JSON
sudo mkdir /etc/collectd/
sudo echo 'datadir: "/var/lib/collectd/"' > /etc/collectd/collection.conf;
sudo chown root:root /etc/collectd/collection.conf;
sudo service collectd start

# Installing client for Collect daemon
cd /var/www/html/
sudo git clone https://github.com/httpdss/collectd-web.git
sudo chmod +x /var/www/html/collectd-web/cgi-bin/*
sudo chown -R root:root /var/www/html/collectd-web
sudo /var/www/html/collectd-web/runserver.py &

# Fronting via Apache HTTP
sudo echo '
AddHandler cgi-script .cgi .pl
ScriptAlias /cgi-bin/ "/var/www/html/collectd-web/cgi-bin/"
<Directory "/var/www/html/collectd-web/cgi-bin">
    Options +ExecCGI
    AllowOverride All
    Order Allow,Deny
    Allow from all
</Directory>' > /etc/httpd/conf.d/collectd.conf;
sudo chown root:root /etc/httpd/conf.d/collectd.conf;
sudo service httpd restart;

# Securing with password
sudo yum -y install httpd-tools
sudo htpasswd -c /var/www/html/collectd-web/.htpass admin
sudo chmod 0644 /var/www/html/collectd-web/.htpass
sudo echo '
<Directory "/var/www/html/collectd-web/" >
    AuthType Basic
    AuthName "Collectd Restricted Page"
    AuthBasicProvider file
    AuthUserFile /var/www/html/collectd-web/.htpass
    Require valid-user
</Directory>' > /etc/httpd/conf.d/collectd.conf;

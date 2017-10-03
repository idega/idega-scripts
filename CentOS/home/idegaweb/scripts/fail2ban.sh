#!/bin/bash
echo "#########################################################################"
echo "# A script to set up fail2ban                                           #"
echo "# By Martynas Stakė (martynas@idega.is) 2017                            #"
echo "#########################################################################"
echo "\n"
sudo yum remove -y postfix

sudo yum install -y fail2ban
cd /etc/fail2ban/
sudo wget https://raw.githubusercontent.com/idega/idega-scripts/master/CentOS/etc/fail2ban/jail.local

cd /etc/fail2ban/jail.d/
sudo wget https://raw.githubusercontent.com/idega/idega-scripts/master/CentOS/etc/fail2ban/jail.d/apache.conf
sudo wget https://raw.githubusercontent.com/idega/idega-scripts/master/CentOS/etc/fail2ban/jail.d/firewalld.conf
sudo wget https://raw.githubusercontent.com/idega/idega-scripts/master/CentOS/etc/fail2ban/jail.d/mysql.conf
sudo wget https://raw.githubusercontent.com/idega/idega-scripts/master/CentOS/etc/fail2ban/jail.d/nginx.conf
sudo wget https://raw.githubusercontent.com/idega/idega-scripts/master/CentOS/etc/fail2ban/jail.d/pam.conf
sudo wget https://raw.githubusercontent.com/idega/idega-scripts/master/CentOS/etc/fail2ban/jail.d/sshd.conf
sudo wget https://raw.githubusercontent.com/idega/idega-scripts/master/CentOS/etc/fail2ban/jail.d/xinetd.conf

sudo systemctl enable fail2ban
sudo systemctl restart fail2ban

sudo yum install -y sendmail
sudo yum install -y sendmail-cf
sudo yum install -y cyrus-sasl-plain

# Now we need to apply this before continue
# https://sendgrid.com/docs/Integrate/Mail_Servers/sendmail.html

cd /etc/mail
m4 sendmail.mc > sendmail.cf
makemap hash access < access

sudo systemctl enable sendmail
sudo systemctl restart sendmail
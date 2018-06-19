#!/bin/sh
# Modify password on /etc/ldap/slapd.d/ldap.idega.is.ldif first
sudo ldapmodify -Y EXTERNAL -H ldapi:/// -f /etc/ldap/slapd.d/ldap.idega.is.ldif;
sudo ldapadd -x -D cn=ldapadm,dc=ldap,dc=idega,dc=is -W -f base.ldif

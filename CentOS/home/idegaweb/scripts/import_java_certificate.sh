#!/bin/bash
sudo keytool -import -alias My-Company -keystore /usr/java/latest/jre/lib/security/cacerts -file /home/idegaweb/tomcat/flen.idega.is/certificates/MyCompany.crt;
sudo keytool -list -v -keystore /usr/java/latest/jre/lib/security/cacerts;
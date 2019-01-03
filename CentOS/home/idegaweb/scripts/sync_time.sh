#!/bin/bash
sudo yum install -y ntp;
sudo systemctl enable ntpd;
sudo systemctl start ntpd;
sudo ntpdate pool.ntp.org;

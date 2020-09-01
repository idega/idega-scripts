#!/bin/bash
/usr/bin/oscap xccdf eval \
        --fetch-remote-resources \
        --profile xccdf_scap-workbench_profile_default_rules \
        --remediate \
        --tailoring-file /root/scripts/scap/content/ssg-centos8-ds-tailoring.xml  \
        --results scan-results.xml /root/scripts/scap/content/ssg-centos8-ds.xml
/usr/bin/oscap xccdf generate report /root/scripts/scap/scan-results.xml > /root/scripts/scap/scan-report.xhtml
/bin/mailx -s "SCAP report (custom)" martynas@dav.lt < /root/scripts/scap/scan-report.xhtml

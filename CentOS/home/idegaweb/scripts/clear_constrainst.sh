#!/bin/sh
awk -v RS= '{gsub(/,\n/, "\n,"); print}'  tables-golf-UTF8-2017-06-05.sql |  sed '/\s*CONSTRAINT/d' > cleared.sql
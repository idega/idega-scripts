#!/bin/bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/u01/app/oracle/product/11.2.0/xe/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/mysql/
./sqldata -sd=oracle,username/password@localhost:1521/service -td=mysql,username/password@localhost:3306,database -t=*.*
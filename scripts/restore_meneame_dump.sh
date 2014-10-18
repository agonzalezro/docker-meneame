#!/bin/bash

/usr/bin/mysqld_safe > /dev/null 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

echo "=> Restoring meneame SQL dump..."

mysql -uroot -e "CREATE DATABASE meneame;"
mysql -uroot meneame < /tmp/meneame/branches/version5/sql/meneame.sql

echo "=> Done!"

mysqladmin -uroot shutdown

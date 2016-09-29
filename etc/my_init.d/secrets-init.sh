#!/bin/bash

# Make noise on any error
set -e

DATABASE="/mnt/pptpd/chap-secrets"
touch $DATABASE
chown root:root $DATABASE
chmod a-rwx $DATABASE
chmod u+rw $DATABASE
echo "Database $DATABASE touched and owned by root:root"

exit 0

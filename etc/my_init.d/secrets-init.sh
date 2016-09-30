#!/bin/bash

# Make noise on any error
set -e

DATABASE="/mnt/pptpd/chap-secrets"

touch $DATABASE

if test -f $DATABASE; then
  if test ! -G $DATABASE || test ! -O $DATABASE; then
    >&2 echo "Taking full ownership of $DATABASE file as it was not owned by root:root"
    chown root:root $DATABASE
    exit 0
  fi
fi

chmod a-rwx $DATABASE
chmod u+rw $DATABASE
echo "Database $DATABASE touched and owned by root:root"
ln -sf /mnt/pptpd/chap-secrets /etc/ppp/chap-secrets

exit 0

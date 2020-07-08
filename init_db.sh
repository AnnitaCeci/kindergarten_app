#!/bin/bash
/usr/bin/mysqld_safe --skip-grant-tables &
sleep 5
bundle exec rake db:migrate

if [[ $? != 0 ]]; then
  echo
  echo "== Failed to migrate. Running setup first."
  echo
  bundle exec rake db:setup
fi
mysql -u root dev < /tmp/dump.sql
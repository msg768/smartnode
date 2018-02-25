#!/bin/bash
# makerun.sh
# Make sure smartcashd is always running.
# Add the following to the crontab (i.e. crontab -e)
# */5 * * * * ~/smartnode/makerun.sh

if ! ps -A | grep smartcashd > /dev/null
then
  smartcashd
fi

if ! ps -A | grep cpulimit > /dev/null
then
  cpulimit -P /usr/bin/smartcashd -l 20
fi

#!/bin/bash
# makerun.sh
# Make sure smartcashd is always running.
# Add the following to the crontab (i.e. crontab -e)
# */5 * * * * ~/smartnode/makerun.sh

if ps ax | grep -v grep | grep smartcashd > /dev/null
then
  exit
else
  smartcashd && sleep 5 &
  cpulimit -P /usr/bin/smartcashd -l 20 &
fi

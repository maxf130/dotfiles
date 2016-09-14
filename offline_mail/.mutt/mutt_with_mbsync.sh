#!/bin/bash

PID="/home/max/.local/var/run/sync_mailboxes.pid"
LOG="/home/max/.local/var/log/mutt_mbsync.log"
touch $LOG

clean_up()
{
  kill -TERM $(cat $PID)
  rm $PID

  sync_mailboxes
  exit
}

trap clean_up SIGTERM SIGHUP SIGINT

sync_mailboxes()
{
  /usr/bin/mbsync -c /home/max/.mbsync/personal.mbsync -a >> $LOG 2>&1
  /usr/bin/mbsync -c /home/max/.mbsync/personal-gmail.mbsync -a >> $LOG 2>&1
  /usr/bin/mbsync -c /home/max/.mbsync/student.mbsync -a >> $LOG 2>&1
  /usr/bin/mbsync -c /home/max/.mbsync/musoft.mbsync -a >> $LOG 2>&1
}

sync_mailboxes_loop()
{
  while true
  do
    sync_mailboxes

    sleep 60
  done
}

sync_mailboxes_loop& >> $LOG 2>&1
echo $! > $PID
/usr/bin/mutt

clean_up

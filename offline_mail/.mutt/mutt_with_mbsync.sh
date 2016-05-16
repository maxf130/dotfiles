#!/bin/sh

PID="/var/run/user/1000/sync_maiboxes.pid"
LOG="/home/max/.local/var/log/mutt_mbsync.log"
touch $LOG

clean_up()
{
  kill -TERM $(cat $PID)
  rm $PID
  exit
}

trap clean_up SIGTERM SIGHUP SIGINT

sync_maiboxes()
{
  while true
  do
    /usr/bin/mbsync -c /home/max/.mbsync/personal.mbsync -aq
    /usr/bin/mbsync -c /home/max/.mbsync/personal-gmail.mbsync -aq
    /usr/bin/mbsync -c /home/max/.mbsync/student.mbsync -aq
    /usr/bin/mbsync -c /home/max/.mbsync/musoft.mbsync -aq

    sleep 250
  done
}

sync_maiboxes& >> $LOG 2>&1
echo $! > $PID
/usr/bin/mutt

clean_up

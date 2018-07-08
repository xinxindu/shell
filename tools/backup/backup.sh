#!/bin/bash

backup_dirs="$@"
backup_interval="7"
use_backup_interval=`date --date="-7 day" "+%F"`

find /home/dxx/github/shell/tools/backup/ -mtime -7 -print > /backup/inc_backup_${use_backup_interval}.log

#差异备份，完成备份必须要有
#tar -N $use_backup_interval -zpcvf /backup/inc_backup.tar.gz $backup_dirs
tar -N $use_backup_interval -jpcvf /backup/inc_backup_${use_backup_interval}.tar.bz2 $backup_dirs

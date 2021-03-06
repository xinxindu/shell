#!/bin/bash

backup_dirs="$@"
backup_interval="7"
use_backup_interval=`date --date="-7 day" "+%F"`

find $backup_dirs -mtime -7 -print > /backup/inc_backup_${use_backup_interval}.log

#差异备份
#tar -N $use_backup_interval -zpcvf /backup/inc_backup.tar.gz $backup_dirs
tar -N $use_backup_interval -jpcvf /backup/inc_backup_${use_backup_interval}.tar.bz2 $backup_dirs

#恢复
#tar -N $use_backup_interval -jpxvf /backup/inc_backup_${use_backup_interval}.tar.bz2
#cp -rf /backup/home /


#rsync -av /test/ /backup/
#rsync -av /backup/ /test/
#rsync -av -e ssh /test/ ubuntu@192.168.1.3:/backup/

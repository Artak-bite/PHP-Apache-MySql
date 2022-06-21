#!/bin/bash

# ┌───────────── minute (0 - 59)
# │     ┌───────────── hour (0 - 23)
# │     │     ┌───────────── day of the month (1 - 31)
# │     │     │   ┌───────────── month (1 - 12)
# │     │     │   │   ┌───────────── day of the week (0 - 6) (Sunday to Saturday;
# │     │     │   │   │                                   7 is also Sunday on some systems)
# │     │     │   │   │
# │     │     │   │   │
# *     *     *   *   *     <command to execute>

mysql_password=&quot;guntantin;
mysql_user=&quot;root&quot;
mysql_port=&quot;3306&quot;
backup_dir=&quot;/opt/mysql/backup&quot;

dt=$(date +'%Y%m%d_%H%M')
echo &quot;Backup starts: $(date +&quot;%Y-%m-%d %H:%M:%S&quot;)&quot;


# execute the backup command:
mysqldump -hmysql -P$mysql_port -u$mysql_user -p$mysql_password $mysql_db --single-transaction --quick --lock-tables=false &gt;$backup_dir/mysql_backup_&quot;$dt&quot;.sql

find $backup_dir -mtime +7 -type f -name '*.sql' -exec rm -rf {} \;
echo &quot;Backup ends: $(date +&quot;%Y-%m-%d %H:%M:%S&quot;)&quot;

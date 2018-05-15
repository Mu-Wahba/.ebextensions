#!/bin/bash
#collect Memory metrics"
cd ~
wget http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip
unzip CloudWatchMonitoringScripts-1.2.1.zip
rm CloudWatchMonitoringScripts-1.2.1.zip
yum install -y perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https
mv aws-scripts-mon/ /home/ec2-user
crontab -l | grep -q 'mon-put-instance-data.pl' || crontab -l | { cat; echo '*/5 * * * * /home/ec2-user/aws-scripts-mon/mon-put-instance-data.pl --mem-util --mem-used --mem-avail --from-cron'; } | crontab -


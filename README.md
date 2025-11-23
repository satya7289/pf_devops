# pf_devops


- cron for backup
0 0 * * * PGPASSWORD=postgres@7289 /opt/website/scripts/snapshot.sh >> /opt/website/scripts/snapshot.log
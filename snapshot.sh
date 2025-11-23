##############################
#chmod +x snapshot.sh
# to run: PGPASSWORD=password ./snapshot.sh
#################

#!/bin/bash

DIR=/tmp
DB_NAME=fluteDB
DB_USER=postgres
BUCKET_NAME=flute-database-backup
DUMP_PATH="$DIR/$DB_NAME_$(date +"%Y-%m-%d@%H-%M").dump"

echo "
started snapshot script ....
DB_NAME=$DB_NAME
DB_USER=$DB_USER
BUCKET_NAME=$BUCKET_NAME
DUMP_PATH=$DUMP_PATH
"

#echo "hello" | cat > $DUMP_PATH

# dump database
pg_dump -U $DB_USER $DB_NAME>$DUMP_PATH

echo "dumpped success"

# sync to s3
/usr/local/bin/aws s3 cp $DUMP_PATH s3://$BUCKET_NAME 

# remove dump path
rm $DUMP_PATH
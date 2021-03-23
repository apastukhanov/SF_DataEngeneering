tabName=$1
dbName=$2

echo -ne "Importing table $tabName from  $dbName..."

hdfs dfs -rm -r -f -skipTrash /apps/hive/warehouse/pae_db.db/$tabName/file > sqoop_stout.txt 2>sqoop_stderr.txt

export JAVA_HOME="/usr"

/usr/lib/sqoop/bin/sqoop import --connect jdbc:mysql://10.93.1.9/skillfactory \
        --username mysql --password arenadata \
        --hive-import -m 1 \
        --table $tabName \
        --hive-overwrite \
        --hive-table  $dbName.$tabName  > sqoop_stdout.txt 2>sqoop_stderr.txt

if [ $? -eq 0 ]
then
  echo "Done!"
else
  echo "Something went wrong! Table $tabName is not imported!"
fi

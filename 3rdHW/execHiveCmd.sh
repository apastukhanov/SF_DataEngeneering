sql=$1

echo "Executing Hive QL command: '$sql'...\c"

cat > /tmp/sql.txt << EOF
!connect  jdbc:hive2://10.93.1.9:10000 hive eee;\n
$sql;
EOF

beeline -f /tmp/sql.txt > hive_stdout.txt 2> hive_stderr.txt

if [ $? -eq 0 ]
then
  echo "Done!"
else
  echo  "\nSomething went wrong! SQL script is not executed!" \
          "\nCheck log in 'hive_stderr.txt'!"
fi

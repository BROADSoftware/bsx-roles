
id=1G


echo "DELETE TERASORT ${id}"

hdfs dfs -rm -r /user/ts/terasort/teragen${id}out
hdfs dfs -rm -r /user/ts/terasort/terasort${id}out
hdfs dfs -rm -r /user/ts/terasort/teravalidate${id}out

rm ts${id}.log


wget http://www.apache.org/licenses/LICENSE-2.0.txt
wget http://www.gnu.org/licenses/gpl-3.0.txt


Then:
hive -e "CREATE DATABASE test"
hive -e "CREATE TABLE test.doc1 (line STRING);"
hive -e "LOAD DATA LOCAL INPATH 'LICENSE-2.0.txt' OVERWRITE INTO TABLE test.doc1;"

hive -e "CREATE TABLE test.wordcount1 AS SELECT word, count(1) AS count FROM (SELECT explode(split(line, '\\\s')) AS word FROM test.doc1) AS w GROUP BY word;"

hive -e "SELECT * FROM test.wordcount1 ORDER BY count ASC;"

Also

hive -e "CREATE TABLE test.doc2 (line STRING);"
hive -e "LOAD DATA LOCAL INPATH 'gpl-3.0.txt' OVERWRITE INTO TABLE test.doc2;"

hive -e "CREATE TABLE test.wordcount2 AS SELECT word, count(1) AS count FROM (SELECT explode(split(line, '\\\s')) AS word FROM test.doc2) AS w GROUP BY word;"

hive -e "SELECT * FROM test.wordcount2 ORDER BY count ASC;"

hive -e "CREATE TABLE test.wordcount12 AS SELECT wc1.word, wc1.count AS count1, wc2.count AS count2, wc1.count + wc2.count AS count FROM test.wordcount1 AS wc1 INNER JOIN test.wordcount2 AS wc2 ON wc1.word = wc2.word WHERE length(wc1.word) > 0 "


hive -e "SELECT * FROM test.wordcount12 WHERE count > 100 ORDER BY count ASC"

SELECT word, count FROM wordcount1 WHERE LENGTH(word) > 4 ORDER BY COUNT DESC LIMIT 10;

select * from wordcount3 WHERE LENGTH(word) > 4 ORDER BY COUNT DESC LIMIT 10;

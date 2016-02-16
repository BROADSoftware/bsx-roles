# Number of 100 bytes rows
terasort_size=10000000
id=1G

log=/tmp/ts${id}.log

echo "TERASORT ${id} (Size:${terasort_size})" >>$log

echo "--------------------------------- START teragen  ${id} (Size:${terasort_size}): $(date)" >>$log
time hadoop jar  /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples-*.jar teragen -Dmapreduce.job.maps=78 -Ddfs.block.size=536870912 -Dmapred.map.tasks.speculative.execution=true -Dmapred.compress.map.output=true ${terasort_size} /user/ts/terasort/teragen${id}out >>$log 2>&1

echo "--------------------------------- END teragen and START terasort ${id} (Size:${terasort_size}): $(date)" >>$log

time hadoop jar  /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples-*.jar  terasort -Dmapreduce.job.maps=78 -Dmapred.reduce.tasks=18 -Ddfs.block.size=536870912 /user/ts/terasort/teragen${id}out /user/ts/terasort/terasort${id}out >>$log 2>&1

echo "--------------------------------- END terasort and START teravalidate ${id} (Size:${terasort_size}): $(date)" >>$log

time hadoop jar  /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples-*.jar   teravalidate -Dmapreduce.job.maps=78 -Ddfs.block.size=536870912 /user/ts/terasort/terasort${id}out /user/ts/terasort/teravalidate${id}out >>$log 2>&1

echo "--------------------------------- END teravalidate ${id} (Size:${terasort_size}): $(date)" >>$log

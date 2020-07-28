- https://superbc.dev/index.php/2019/12/19/seelocallyinstalledstandalonespark/
- https://qiita.com/mkyz08/items/0c1d8fa47179933c3a56

- http://hktech.hatenablog.com/

ここらへんあけておく
4040,8080,7070

dbeaverでspark-sqlを使うときはたぶんこのポート
'sparkDriver' on port 46667

パス設定
```
echo 'export JAVA_HOME=/usr/local/src/jdk-11' >>$HOME/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >>$HOME/.bashrc
echo 'APACHE_SPARK_HOME=/usr/local/src/spark-3.0.0-preview2-bin-hadoop3.2' >>$HOME/.bashrc
echo 'export PATH=$APACHE_SPARK_HOME/bin:$APACHE_SPARK_HOME/sbin:$PATH' >>$HOME/.bashrc
source ~/.bashrc
```

ユーザー登録
```
#!/usr/bin/env bash

groupadd -g 1002 hadoop && \
useradd -m -g hadoop -u 1002 hadoop && \
chsh -s /bin/bash hadoop && \
echo 'hadoop:hadoop_pwd' | chpasswd && \
echo 'hadoop ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
```

hadoopバンドルのsparkインストール

```
cd /usr/local/src
curl -sSLO https://ftp.jaist.ac.jp/pub/apache/spark/spark-3.0.0-preview2/spark-3.0.0-preview2-bin-hadoop3.2.tgz #こっちうごいた
tar xvfz spark-3.0.0-preview2-bin-hadoop3.2.tgz
chown -R hadoop:hadoop spark-3.0.0-preview2-bin-hadoop3.2
```

プロセス起動

hadoopユーザーで実行

```
$ start-master.sh
starting org.apache.spark.deploy.master.Master, logging to /usr/local/src/spark-3.0.0-preview2-bin-hadoop3.2/logs/spark-hadoop-org.apache.spark.deploy.master.Master-1-docker-container-ubuntu-16-04-postgres-python-vim.out


$ ps uax
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
postgres     1  0.0  0.0  19372  2044 pts/0    Ss+  15:42   0:00 /bin/bash
postgres  3665  0.0  0.0  19384  2152 pts/1    Ss   16:18   0:00 /bin/bash
root      4036  0.0  0.0  48124  1728 pts/1    S    16:50   0:00 su hadoop
hadoop    4037  0.0  0.0  19388  2144 pts/1    S    16:50   0:00 bash
hadoop    4062  2.6  0.5 6201592 195320 pts/1  Sl   16:50   0:03 /usr/local/src/jdk-11/bin/java -cp /usr/local/src/spark-3.0.0-preview2-bin-hadoop3.2/conf/:/usr/local/src/spark-3.0.0-preview2-bin-hadoop3.2/jars/
hadoop    4142  0.0  0.0  35556  1672 pts/1    R+   16:52   0:00 ps uax

$ lsof -i:7077
COMMAND  PID   USER   FD   TYPE   DEVICE SIZE/OFF NODE NAME
java    4062 hadoop  316u  IPv4 13385208      0t0  TCP docker-container-ubuntu-16-04-postgres-python-vim:7077 (LISTEN)
```

シェル起動RPEL

```
$ spark-shell
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by org.apache.spark.unsafe.Platform (file:/usr/local/src/spark-3.0.0-preview2-bin-hadoop3.2/jars/spark-unsafe_2.12-3.0.0-preview2.jar) to constructor java.nio.DirectByteBuffer(long,int)
WARNING: Please consider reporting this to the maintainers of org.apache.spark.unsafe.Platform
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
20/05/12 07:55:23 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Using Spark's default log4j profile: org/apache/spark/log4j-defaults.properties
Setting default log level to "WARN".
To adjust logging level use sc.setLogLevel(newLevel). For SparkR, use setLogLevel(newLevel).
Spark context Web UI available at http://docker-container-ubuntu-16-04-postgres-python-vim:4040
Spark context available as 'sc' (master = local[*], app id = local-1589270126472).
Spark session available as 'spark'.
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 3.0.0-preview2
      /_/

Using Scala version 2.12.10 (OpenJDK 64-Bit Server VM, Java 11)
Type in expressions to have them evaluated.
Type :help for more information.

scala>

scala>

scala>

scala>

scala>

scala> print うんこ
<console>:24: error: missing argument list for method print in object Predef
Unapplied methods are only converted to functions when a function type is expected.
You can make this conversion explicit by writing `print _` or `print(_)` instead of `print`.
       print うんこ
       ^

scala> print("うんこ")
うんこ
```


スパークsql起動
```
$ spark-sql
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by org.apache.spark.unsafe.Platform (file:/usr/local/src/spark-3.0.0-preview2-bin-hadoop3.2/jars/spark-unsafe_2.12-3.0.0-preview2.jar) to constructor java.nio.DirectByteBuffer(long,int)
WARNING: Please consider reporting this to the maintainers of org.apache.spark.unsafe.Platform
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
20/05/12 10:30:16 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
log4j:WARN No appenders could be found for logger (org.apache.hadoop.hive.conf.HiveConf).
log4j:WARN Please initialize the log4j system properly.
log4j:WARN See http://logging.apache.org/log4j/1.2/faq.html#noconfig for more info.
Using Spark's default log4j profile: org/apache/spark/log4j-defaults.properties
20/05/12 10:30:17 INFO SparkContext: Running Spark version 3.0.0-preview2
20/05/12 10:30:17 INFO ResourceUtils: ==============================================================
20/05/12 10:30:17 INFO ResourceUtils: Resources for spark.driver:

20/05/12 10:30:17 INFO ResourceUtils: ==============================================================
20/05/12 10:30:17 INFO SparkContext: Submitted application: SparkSQL::172.17.0.2
20/05/12 10:30:17 INFO SecurityManager: Changing view acls to: hadoop
20/05/12 10:30:17 INFO SecurityManager: Changing modify acls to: hadoop
20/05/12 10:30:17 INFO SecurityManager: Changing view acls groups to:
20/05/12 10:30:17 INFO SecurityManager: Changing modify acls groups to:
20/05/12 10:30:17 INFO SecurityManager: SecurityManager: authentication disabled; ui acls disabled; users  with view permissions: Set(hadoop); groups with view permissions: Set(); users  with modify permissions: Set(hadoop); groups with modify permissions: Set()
20/05/12 10:30:17 INFO Utils: Successfully started service 'sparkDriver' on port 46667.
20/05/12 10:30:17 INFO SparkEnv: Registering MapOutputTracker
20/05/12 10:30:17 INFO SparkEnv: Registering BlockManagerMaster
20/05/12 10:30:17 INFO BlockManagerMasterEndpoint: Using org.apache.spark.storage.DefaultTopologyMapper for getting topology information
20/05/12 10:30:17 INFO BlockManagerMasterEndpoint: BlockManagerMasterEndpoint up
20/05/12 10:30:17 INFO SparkEnv: Registering BlockManagerMasterHeartbeat
20/05/12 10:30:17 INFO DiskBlockManager: Created local directory at /tmp/blockmgr-2b2a60a2-c465-44f8-b1a9-6cc84e44df27
20/05/12 10:30:17 INFO MemoryStore: MemoryStore started with capacity 434.4 MiB
20/05/12 10:30:17 INFO SparkEnv: Registering OutputCommitCoordinator
20/05/12 10:30:17 INFO Utils: Successfully started service 'SparkUI' on port 4040.
20/05/12 10:30:17 INFO SparkUI: Bound SparkUI to 0.0.0.0, and started at http://docker-container-ubuntu-16-04-postgres-python-vim:4040
20/05/12 10:30:17 INFO Executor: Starting executor ID driver on host docker-container-ubuntu-16-04-postgres-python-vim
20/05/12 10:30:17 INFO Utils: Successfully started service 'org.apache.spark.network.netty.NettyBlockTransferService' on port 36940.
20/05/12 10:30:17 INFO NettyBlockTransferService: Server created on docker-container-ubuntu-16-04-postgres-python-vim:36940
20/05/12 10:30:17 INFO BlockManager: Using org.apache.spark.storage.RandomBlockReplicationPolicy for block replication policy
20/05/12 10:30:17 INFO BlockManagerMaster: Registering BlockManager BlockManagerId(driver, docker-container-ubuntu-16-04-postgres-python-vim, 36940, None)
20/05/12 10:30:17 INFO BlockManagerMasterEndpoint: Registering block manager docker-container-ubuntu-16-04-postgres-python-vim:36940 with 434.4 MiB RAM, BlockManagerId(driver, docker-container-ubuntu-16-04-postgres-python-vim, 36940, None)
20/05/12 10:30:17 INFO BlockManagerMaster: Registered BlockManager BlockManagerId(driver, docker-container-ubuntu-16-04-postgres-python-vim, 36940, None)
20/05/12 10:30:17 INFO BlockManager: Initialized BlockManager: BlockManagerId(driver, docker-container-ubuntu-16-04-postgres-python-vim, 36940, None)
20/05/12 10:30:18 INFO SharedState: Setting hive.metastore.warehouse.dir ('null') to the value of spark.sql.warehouse.dir ('file:/home/hadoop/spark-warehouse').
20/05/12 10:30:18 INFO SharedState: Warehouse path is 'file:/home/hadoop/spark-warehouse'.
20/05/12 10:30:18 INFO HiveUtils: Initializing HiveMetastoreConnection version 2.3.6 using Spark classes.
20/05/12 10:30:18 INFO HiveClientImpl: Warehouse location for Hive client (version 2.3.6) is file:/home/hadoop/spark-warehouse
20/05/12 10:30:18 WARN HiveConf: HiveConf of name hive.stats.jdbc.timeout does not exist
20/05/12 10:30:18 WARN HiveConf: HiveConf of name hive.stats.retries.wait does not exist
20/05/12 10:30:18 INFO HiveMetaStore: 0: Opening raw store with implementation class:org.apache.hadoop.hive.metastore.ObjectStore
20/05/12 10:30:18 INFO ObjectStore: ObjectStore, initialize called
20/05/12 10:30:18 INFO Persistence: Property hive.metastore.integral.jdo.pushdown unknown - will be ignored
20/05/12 10:30:18 INFO Persistence: Property datanucleus.cache.level2 unknown - will be ignored
20/05/12 10:30:20 INFO ObjectStore: Setting MetaStore object pin classes with hive.metastore.cache.pinobjtypes="Table,StorageDescriptor,SerDeInfo,Partition,Database,Type,FieldSchema,Order"
20/05/12 10:30:21 INFO MetaStoreDirectSql: Using direct SQL, underlying DB is DERBY
20/05/12 10:30:21 INFO ObjectStore: Initialized ObjectStore
20/05/12 10:30:21 WARN ObjectStore: Version information not found in metastore. hive.metastore.schema.verification is not enabled so recording the schema version 2.3.0
20/05/12 10:30:21 WARN ObjectStore: setMetaStoreSchemaVersion called but recording version is disabled: version = 2.3.0, comment = Set by MetaStore hadoop@172.17.0.2
20/05/12 10:30:21 WARN ObjectStore: Failed to get database default, returning NoSuchObjectException
20/05/12 10:30:21 INFO HiveMetaStore: Added admin role in metastore
20/05/12 10:30:21 INFO HiveMetaStore: Added public role in metastore
20/05/12 10:30:21 INFO HiveMetaStore: No user is added in admin role, since config is empty
20/05/12 10:30:21 INFO HiveMetaStore: 0: get_all_functions
20/05/12 10:30:21 INFO audit: ugi=hadoop	ip=unknown-ip-addr	cmd=get_all_functions
20/05/12 10:30:22 INFO HiveMetaStore: 0: get_database: default
20/05/12 10:30:22 INFO audit: ugi=hadoop	ip=unknown-ip-addr	cmd=get_database: default
Spark master: local[*], Application Id: local-1589279417804
20/05/12 10:30:22 INFO SparkSQLCLIDriver: Spark master: local[*], Application Id: local-1589279417804


spark-sql> select version() ;
20/05/12 10:33:56 INFO CodeGenerator: Code generated in 98.264959 ms
20/05/12 10:33:56 INFO SparkContext: Starting job: main at NativeMethodAccessorImpl.java:0
20/05/12 10:33:56 INFO DAGScheduler: Got job 0 (main at NativeMethodAccessorImpl.java:0) with 1 output partitions
20/05/12 10:33:56 INFO DAGScheduler: Final stage: ResultStage 0 (main at NativeMethodAccessorImpl.java:0)
20/05/12 10:33:56 INFO DAGScheduler: Parents of final stage: List()
20/05/12 10:33:56 INFO DAGScheduler: Missing parents: List()
20/05/12 10:33:56 INFO DAGScheduler: Submitting ResultStage 0 (MapPartitionsRDD[2] at main at NativeMethodAccessorImpl.java:0), which has no missing parents
20/05/12 10:33:56 INFO MemoryStore: Block broadcast_0 stored as values in memory (estimated size 6.4 KiB, free 434.4 MiB)
20/05/12 10:33:56 INFO MemoryStore: Block broadcast_0_piece0 stored as bytes in memory (estimated size 3.3 KiB, free 434.4 MiB)
20/05/12 10:33:56 INFO BlockManagerInfo: Added broadcast_0_piece0 in memory on docker-container-ubuntu-16-04-postgres-python-vim:38228 (size: 3.3 KiB, free: 434.4 MiB)
20/05/12 10:33:56 INFO SparkContext: Created broadcast 0 from broadcast at DAGScheduler.scala:1206
20/05/12 10:33:56 INFO DAGScheduler: Submitting 1 missing tasks from ResultStage 0 (MapPartitionsRDD[2] at main at NativeMethodAccessorImpl.java:0) (first 15 tasks are for partitions Vector(0))
20/05/12 10:33:56 INFO TaskSchedulerImpl: Adding task set 0.0 with 1 tasks
20/05/12 10:33:56 INFO TaskSetManager: Starting task 0.0 in stage 0.0 (TID 0, docker-container-ubuntu-16-04-postgres-python-vim, executor driver, partition 0, PROCESS_LOCAL, 7561 bytes)
20/05/12 10:33:56 INFO Executor: Running task 0.0 in stage 0.0 (TID 0)
20/05/12 10:33:56 INFO Executor: Finished task 0.0 in stage 0.0 (TID 0). 1504 bytes result sent to driver
20/05/12 10:33:56 INFO TaskSetManager: Finished task 0.0 in stage 0.0 (TID 0) in 95 ms on docker-container-ubuntu-16-04-postgres-python-vim (executor driver) (1/1)
20/05/12 10:33:56 INFO TaskSchedulerImpl: Removed TaskSet 0.0, whose tasks have all completed, from pool
20/05/12 10:33:56 INFO DAGScheduler: ResultStage 0 (main at NativeMethodAccessorImpl.java:0) finished in 0.220 s
20/05/12 10:33:56 INFO DAGScheduler: Job 0 is finished. Cancelling potential speculative or zombie tasks for this job
20/05/12 10:33:56 INFO TaskSchedulerImpl: Killing all running tasks in stage 0: Stage finished
20/05/12 10:33:56 INFO DAGScheduler: Job 0 finished: main at NativeMethodAccessorImpl.java:0, took 0.246415 s
3.0.0 bcadd5c3096109878fe26fb0d57a9b7d6fdaa257
Time taken: 1.49 seconds, Fetched 1 row(s)
20/05/12 10:33:56 INFO SparkSQLCLIDriver: Time taken: 1.49 seconds, Fetched 1 row(s)
```

pyspark起動

```
$ pyspark
Python 3.7.4 (default, May  5 2020, 13:19:00)
[GCC 5.4.0 20160609] on linux
Type "help", "copyright", "credits" or "license" for more information.
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by org.apache.spark.unsafe.Platform (file:/usr/local/src/spark-3.0.0-preview2-bin-hadoop3.2/jars/spark-unsafe_2.12-3.0.0-preview2.jar) to constructor java.nio.DirectByteBuffer(long,int)
WARNING: Please consider reporting this to the maintainers of org.apache.spark.unsafe.Platform
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
20/05/12 10:48:16 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Using Spark's default log4j profile: org/apache/spark/log4j-defaults.properties
Setting default log level to "WARN".
To adjust logging level use sc.setLogLevel(newLevel). For SparkR, use setLogLevel(newLevel).
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /__ / .__/\_,_/_/ /_/\_\   version 3.0.0-preview2
      /_/

Using Python version 3.7.4 (default, May  5 2020 13:19:00)
SparkSession available as 'spark'.
>>>
>>>
>>>
>>>
>>>
>>> print("うんこ")
うんこ
>>>
>>>
>>>
>>>
>>>
>>>

```


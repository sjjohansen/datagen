CREATE TABLE event_test.hbase_counts (username STRING, count INT)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ('hbase.columns.mapping' = ':key,cf1:count')
TBLPROPERTIES ('hbase.table.name' = 'event_counts');

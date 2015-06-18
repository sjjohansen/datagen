CREATE EXTERNAL TABLE event_test.staging_events_batch_${hiveconf:batch_id} (
  eventid int,
  username string,
  timestamp bigint
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
ESCAPED BY '\\'
STORED AS TEXTFILE
LOCATION '/user/${system:user.name}/events_raw/batch_${hiveconf:batch_id}';

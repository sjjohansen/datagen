INSERT OVERWRITE TABLE event_test.events PARTITION (batch_id=${hiveconf:batch_id}, month, date)
SELECT
  eventid,
  username,
  timestamp,
  CAST(from_unixtime(timestamp, 'HH') as int) as hour_of_day,
  from_unixtime(timestamp, 'yyyy-MM') as month,
  from_unixtime(timestamp, 'yyyy-MM-dd') as date
FROM
  event_test.staging_events_batch_${hiveconf:batch_id};


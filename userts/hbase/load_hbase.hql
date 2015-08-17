INSERT OVERWRITE TABLE event_test.hbase_counts
SELECT
  username,
  count
FROM
  event_test.event_counts;


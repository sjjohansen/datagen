DROP TABLE IF EXISTS event_test.counts_out;
CREATE EXTERNAL TABLE event_test.counts_out
(username STRING, count INT)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' 
STORED AS TEXTFILE LOCATION '/user/${JOB_USER}/count_output';
INSERT OVERWRITE TABLE event_test.counts_out
SELECT
  username,
  count
FROM
  event_test.event_counts;

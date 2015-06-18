CREATE TABLE event_test.events (
  eventid int,
  username string,
  timestamp bigint,
  hour_of_day int
)
COMMENT 'raw user events'
PARTITIONED BY (batch_id int, month string, date string)
STORED AS ORC;

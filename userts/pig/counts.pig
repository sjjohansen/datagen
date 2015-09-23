events = load 'events_raw/batch_[1-4]' using PigStorage(',') as (eventid:int, username:chararray, timestamp:int);
by_user = GROUP events BY username;
age_counts = FOREACH by_user GENERATE group as username, COUNT(events);
DUMP age_counts;


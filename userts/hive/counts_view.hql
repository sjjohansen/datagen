CREATE VIEW IF NOT EXISTS event_test.event_counts (username, count) AS
SELECT username,count(*) as count
FROM event_test.events
GROUP BY username;

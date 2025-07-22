-- Create a stream on raw users
CREATE OR REPLACE STREAM users_stream ON TABLE ods.users_clean;

-- Task to insert new rows into analytics table
CREATE OR REPLACE TASK task_load_to_dwh
  WAREHOUSE = my_wh
  SCHEDULE = 'USING CRON 0 * * * * America/New_York'
AS
INSERT INTO dwh.users_analytics
SELECT id, name, age
FROM ods.users_clean
WHERE METADATA$ISUPDATE = FALSE;

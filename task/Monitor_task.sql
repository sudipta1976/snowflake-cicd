SELECT name, state, scheduled_time, completed_time, error_code, error_message
  FROM TABLE(SNOWFLAKE.INFORMATION_SCHEMA.TASK_HISTORY(
    TASK_NAME => 'RUN_FIRST_NOTEBOOK',
    SCHEDULED_TIME_RANGE_START => DATEADD('hour', -1, CURRENT_TIMESTAMP()),
    RESULT_LIMIT => 100
  ))
  ORDER BY scheduled_time DESC;

  SELECT query_id, query_text, start_time, end_time, execution_status, error_message, total_elapsed_time
  FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
  WHERE query_text ILIKE 'execute notebook%'
  ORDER BY start_time DESC
  LIMIT 10;

SELECT * FROM TABLE(INFORMATION_SCHEMA.NOTEBOOK_HISTORY(
    NOTEBOOK_NAME => 'FIRST'
))
ORDER BY START_TIME DESC;

-- Find the session, then get all queries from that session
SELECT query_id, query_text, start_time, execution_status, error_message
  FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
  WHERE session_id = (
    SELECT session_id FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
    WHERE query_id = '01c66391-0302-bebf-001e-2dd300161322'
  )
  ORDER BY start_time ASC;


EXECUTE TASK RAW.GIT.RUN_FIRST_NOTEBOOK;

-- Find your event table
SHOW PARAMETERS LIKE 'event_table' IN ACCOUNT;

-- Then query it (replace with your event table name)
SELECT TIMESTAMP, VALUE AS LOG_MESSAGE
  FROM snowflake.telemetry.events
  WHERE RECORD_TYPE = 'LOG'
    AND TIMESTAMP > DATEADD('hour', -1, CURRENT_TIMESTAMP())
  ORDER BY TIMESTAMP DESC
  LIMIT 50;

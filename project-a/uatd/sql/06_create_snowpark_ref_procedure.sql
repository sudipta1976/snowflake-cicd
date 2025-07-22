-- Create a Snowpark for Python procedure
CREATE OR REPLACE PROCEDURE SALES_DATA.staging.process_users_v2()
  RETURNS STRING
  LANGUAGE PYTHON
  RUNTIME_VERSION = '3.10'
  PACKAGES = ('snowflake-snowpark-python')
  HANDLER = 'my_func'
AS
$$
--! path=./uatd/snowpark/user_proc.py
$$;
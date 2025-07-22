-- Create a Snowpark for Python procedure
CREATE OR REPLACE PROCEDURE SALES_DATA.staging.process_users_v2()
  RETURNS STRING
  LANGUAGE PYTHON
  RUNTIME_VERSION = '3.10'
  PACKAGES = ('snowflake-snowpark-python')
  IMPORTS = ('@~/code_stage/user_proc.py')
  HANDLER = 'user_proc.my_func'
AS
$$
import user_proc
$$;
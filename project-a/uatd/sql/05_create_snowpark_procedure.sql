-- Create a Snowpark for Python procedure
CREATE OR REPLACE PROCEDURE SALES_DATA.staging.process_users()
  RETURNS STRING
  LANGUAGE PYTHON
  RUNTIME_VERSION = '3.10'
  PACKAGES = ('snowflake-snowpark-python')
  HANDLER = 'my_func'
AS
$$
import sys
from snowflake.snowpark.session import Session

def my_func(session):
    df = session.table("SALES_DATA.ods.users_clean").filter("age > 30")
    df.show()
    return f"Processed {df.count()} users"
$$;
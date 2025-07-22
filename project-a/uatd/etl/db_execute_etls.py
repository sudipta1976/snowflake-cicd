import os
import snowflake.connector

conn = snowflake.connector.connect(
    user=os.getenv('SNOWFLAKE_USER'),
    private_key=os.getenv('SNOWFLAKE_PRIVATE_KEY'),
    account=os.getenv('SNOWFLAKE_ACCOUNT'),
    warehouse='MY_WH',
    database='MY_DB',
    schema='STAGING'
)

cursor = conn.cursor()

# Transform raw to cleaned data
cursor.execute("""
    INSERT INTO ods.users_clean (id, name, birth_year, age)
    SELECT id, name, birth_year, calc_age(birth_year)
    FROM staging.raw_users
""")

# Then pipeline it into analytics layer
cursor.execute("""
    INSERT INTO dwh.users_analytics (id, name, age)
    SELECT id, name, age
    FROM ods.users_clean
""")

print("ETL Execution Completed")

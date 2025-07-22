import snowflake.connector
import os

conn = snowflake.connector.connect(
    user=os.getenv('SNOWFLAKE_USER'),
    private_key=os.getenv('SNOWFLAKE_PRIVATE_KEY'),
    account=os.getenv('SNOWFLAKE_ACCOUNT'),
    warehouse='MY_WH',
    database='MY_DB',
    schema='DWH'
)

cursor = conn.cursor()

# Compare metadata between envs
cursor.execute("DESCRIBE TABLE dwh.users_analytics")
columns = cursor.fetchall()

print("Analytics Table Metadata:")
for col in columns:
    print(f"{col[0]} - {col[1]}")

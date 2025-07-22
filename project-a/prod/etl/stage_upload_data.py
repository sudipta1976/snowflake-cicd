import os
import pandas as pd
import snowflake.connector

# Load data into DataFrame (This would realistically be a local or S3 file)
df = pd.DataFrame({
    'id': [1, 2, 3],
    'name': ['Alice', 'Bob', 'Charlie'],
    'birth_year': [1991, 1985, 1977]
})

# Upload to Snowflake
connection = snowflake.connector.connect(
    user=os.getenv('SNOWFLAKE_USER'),
    private_key=os.getenv('SNOWFLAKE_PRIVATE_KEY'),
    account=os.getenv('SNOWFLAKE_ACCOUNT'),
    warehouse='MY_WH',
    database='MY_DB',
    schema='STAGING'
)

cursor = connection.cursor()
cursor.execute("DELETE FROM staging.raw_users")  # Reset table

# Insert rows
for index, row in df.iterrows():
    cursor.execute(
        f"INSERT INTO staging.raw_users (id, name, birth_year) VALUES (%s, %s, %s)",
        (row['id'], row['name'], row['birth_year'])
    )

print("Uploaded data to staging.raw_users")

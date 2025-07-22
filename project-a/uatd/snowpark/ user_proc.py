# user_proc.py

def my_func(session):
    # Read the "users" table
    df = session.table("SALES_DATA.ods.users_clean")
    
    # Filter users older than 30
    filtered = df.filter(df["age"] > 50)
    
    # Log result (prints to Snowflake logs)
    filtered.show()

    # Return a summary string
    return f"Found {filtered.count()} users over 50"

CREATE OR REPLACE TABLE ods.users_clean (
    id INT,
    name STRING,
    birth_year INT,
    age INT
);

CREATE OR REPLACE TABLE dwh.users_analytics (
    id INT,
    name STRING,
    age INT
);

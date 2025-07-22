-- Drop and recreate schemas (used for UATD/UAT)
DROP SCHEMA IF EXISTS staging CASCADE;
DROP SCHEMA IF EXISTS ods CASCADE;
DROP SCHEMA IF EXISTS dwh CASCADE;

CREATE SCHEMA staging;
CREATE SCHEMA ods;
CREATE SCHEMA dwh;

-- Example table recreation
CREATE OR REPLACE TABLE staging.raw_users (
    id INT,
    name STRING,
    birth_year INT
);

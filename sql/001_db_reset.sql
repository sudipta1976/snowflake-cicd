-- Drop and recreate schemas (used for UATD/UAT)
CREATE DATABASE IF NOT EXISTS SALES_DATA;

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

CREATE OR REPLACE TABLE staging.raw_emp (
    id INT,
    name STRING,
    birth_year INT
    salary INT
);

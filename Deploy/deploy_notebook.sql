-- Deploy first.ipynb notebook from the notebook branch to RAW.GIT schema
-- Co-authored with CoCo

USE DATABASE RAW;
USE SCHEMA GIT;

CREATE OR REPLACE NOTEBOOK RAW.GIT.FIRST
    FROM '@RAW.GIT."snowflake-cicd"/branches/notebook/notebbok/'
    MAIN_FILE = 'first.ipynb'
    QUERY_WAREHOUSE = COMPUTE_WH
    COMMENT = 'Deployed from notebook branch via CI/CD';

ALTER NOTEBOOK RAW.GIT.FIRST ADD LIVE VERSION FROM LAST;

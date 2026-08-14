CREATE OR REPLACE PROCEDURE RAW.GIT.IMNOT_BOT()
RETURNS STRING
LANGUAGE PYTHON
RUNTIME_VERSION = '3.10'
PACKAGES = ('snowflake-snowpark-python')
IMPORTS = ('@RAW.GIT."snowflake-cicd"/branches/main/project-a/uatd/etl/not_bot.py')
HANDLER = 'not_bot.main';

CALL RAW.GIT.IMNOT_BOT();
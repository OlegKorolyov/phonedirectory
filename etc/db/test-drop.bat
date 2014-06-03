@echo off


%PSQL_PATH%psql -f "%~dp0sql\db-drop.sql" -h localhost -d postgres -U postgres %PSQL_OPTIONS% 2>&1
if errorlevel 1 goto err

goto end

:err
echo !!! ERROR !!!

:end
popd

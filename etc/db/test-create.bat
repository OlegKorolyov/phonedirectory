@echo off

pushd %~dp0sql


if not "%CMD_ON_CREATE%" equ "" (
  %CMD_ON_CREATE%
  echo.
)

%PSQL_PATH%psql -W -f "%~dp0sql\db-create.sql" -h localhost -d postgres -U postgres %PSQL_OPTIONS% 2>&1
if errorlevel 1 goto err

%PSQL_PATH%psql -f "%~dp0sql\schema-create.sql" -h localhost -d phonedirectory -U phonedirectory %PSQL_OPTIONS% 2>&1
if errorlevel 1 goto err

goto end

:err
echo !!! ERROR !!!

:end
popd

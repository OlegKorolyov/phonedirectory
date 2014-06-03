\encoding UTF8
set client_min_messages to warning;
\i ../../../logic/target/hibernate3/sql/schema-phonedirectory.sql
\i test.sql
\i reset-sequences.sql

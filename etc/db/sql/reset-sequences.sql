CREATE OR REPLACE FUNCTION reset_sequence()  RETURNS Boolean AS $BODY$
DECLARE
     row_data information_schema.columns%ROWTYPE;
BEGIN
     FOR row_data IN select * from information_schema.columns where column_default like 'nextval%'  LOOP
         EXECUTE 'SELECT setval( ''' || row_data.table_name || '_' || row_data.column_name || '_seq'  || ''', ' || '(SELECT MAX(' || row_data.column_name || ') FROM ' || row_data.table_name || ')' || '+1)';
     END LOOP;
     RETURN TRUE;
END;
$BODY$
LANGUAGE 'plpgsql';

select reset_sequence();

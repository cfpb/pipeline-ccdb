-- Verify ccdb:datecast on pg

BEGIN;

SELECT 1/COUNT(*) 
    FROM information_schema.columns 
    WHERE table_name='record' 
    AND column_name='Date received' 
    AND data_type='date';

ROLLBACK;

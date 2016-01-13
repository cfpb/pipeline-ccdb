-- Verify ccdb:ccdbschema on pg

BEGIN;

SELECT 1/COUNT(*) FROM information_schema.schemata WHERE schema_name = 'ccdb';
SELECT 1/COUNT(*) 
    FROM information_schema.tables 
    WHERE table_name='record'
    AND table_schema='ccdb';

-- SELECT pg_catalog.has_schema_privilege("ccdb", "usage");
-- SELECT pg_catalog.has_table_privilege("ccdb.record","select");
-- XXX Add verifications here.

ROLLBACK;

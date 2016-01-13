-- Revert ccdb:ccdbschema from pg

BEGIN;

DROP SCHEMA ccdb CASCADE;

-- XXX Add DDLs here.

COMMIT;

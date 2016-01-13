-- Revert ccdb:datecast from pg

BEGIN;

ALTER TABLE ccdb.record ALTER COLUMN "Date received" TYPE text 
    USING to_char("Date received",'dd/mm/yyyy');
-- XXX Add DDLs here.

COMMIT;

-- Deploy ccdb:datecast to pg

BEGIN;

ALTER TABLE ccdb.record ALTER COLUMN "Date received" 
    TYPE date USING to_date("Date received", 'dd/mm/yyyy');
-- XXX Add DDLs here.

COMMIT;

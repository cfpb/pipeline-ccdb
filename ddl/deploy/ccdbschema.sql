-- Deploy ccdb:ccdbschema to pg

BEGIN;

CREATE SCHEMA ccdb;
CREATE TABLE ccdb.record (
"Date received" text,
"Product" text,
"Sub-product" text,
"Issue" text,
"Sub-issue" text,
"Consumer complaint narrative" text,
"Company public response" text,
"Company" text,
"State" text,
"ZIP code" text,
"Submitted via" text,
"Date sent to company" text,
"Company response to consumer" text,
"Timely response?" text,
"Consumer disputed?" text,
"Complaint ID" text);

-- XXX Add DDLs here.

COMMIT;

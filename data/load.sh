#!/bin/bash

# http://www.manniwood.com/postgresql_and_bash_stuff/
# Set these environmental variables to override them,
# but they have safe defaults.
export PGHOST=${PGHOST-localhost}
export PGPORT=${PGPORT-5432}
export PGDATABASE=${PGDATABASE-my_database}
export PGUSER=${PGUSER-my_user}
export PGPASSWORD=${PGPASSWORD-my_password}

pwd
echo db:pg:\\\\$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT\\$PGDATABASE
psql -c "\copy ccdb.record FROM 'cfpb_ccdb.csv' DELIMITER ',' CSV HEADER;"
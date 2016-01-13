PGHOST ?=localhost
PGPORT ?=5432
PGDATABASE ?=my_database
PGUSER ?=my_user
PGPASSWORD ?=my_password

download:
		python scrape.py
migrate:
		cd ddl; \
		sqitch deploy db:pg://$(PGUSER):$(PGPASSWORD)@$(PGHOST):$(PGPORT)/$(PGDATABASE)
verify:
		cd ddl; \
		sqitch verify db:pg://$(PGUSER):$(PGPASSWORD)@$(PGHOST):$(PGPORT)/$(PGDATABASE)
load:
		cd data; \
		./load.sh
clean:
	   rm data/cfpb_ccdb.csv

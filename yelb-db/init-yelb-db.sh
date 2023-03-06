#!/bin/bash
set -e

if [[ "${DB_ENVIRONMENT}" == "production" ]]; then

  psql -v ON_ERROR_STOP=1  <<-EOSQL
      \connect $PGDATABASE;
    CREATE TABLE restaurants (
        name        char(30),
        count       integer,
        PRIMARY KEY (name)
    );
    INSERT INTO restaurants (name, count) VALUES ('outback', 0);
    INSERT INTO restaurants (name, count) VALUES ('bucadibeppo', 0);
    INSERT INTO restaurants (name, count) VALUES ('chipotle', 0);
    INSERT INTO restaurants (name, count) VALUES ('ihop', 0);
EOSQL
else
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE yelbdatabase;
    \connect yelbdatabase;
	CREATE TABLE restaurants (
    	name        char(30),
    	count       integer,
    	PRIMARY KEY (name)
	);
	INSERT INTO restaurants (name, count) VALUES ('outback', 0);
	INSERT INTO restaurants (name, count) VALUES ('bucadibeppo', 0);
	INSERT INTO restaurants (name, count) VALUES ('chipotle', 0);
	INSERT INTO restaurants (name, count) VALUES ('ihop', 0);
EOSQL
fi

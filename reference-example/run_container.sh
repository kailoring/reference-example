#!/bin/bash

# Change into the mysql directory and build the sample image
pushd mysql
docker build -t mysql-sample .
popd

# Run the container starting the database
docker run --rm --name sample-database -d mysql-sample

sleep 15

# Create a non-root user
docker exec -i sample-database mysql -uroot -pcsci459 < mysql/createuser.sql

# Create the sample database and a table in the database. Load some data
docker exec -i sample-database mysql -ucsci459 -pcsci459 < mysql/createdata.sql

# Print the contents of the database
docker exec -i sample-database mysql -ucsci459 -pcsci459 -e "select * from testdb.testtab;"

# Change into the webserver directory and build the sample image
pushd webserver
docker build -t sample-webserver .
popd

# Run the container starting the webserver
docker run --rm --name web-php --link sample-database:mysql -p 8080:80 -d sample-webserver

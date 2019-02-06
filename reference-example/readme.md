# Docker Reference Example

Create containers for a database and a simple web application

## Files

- `run_container.sh`

  This shell script:

    1. Builds the mysql container
    2. Runs the container
    3. Waits for the database to start
    4. Creates a mysql user
    5. Creates and loads the sample database
    6. Runs a command to print the database contents
    7. Builds the webserver container
    8. Runs the webserver container

## Directories

### mysql

This directory contains the files necessary to build the Docker container for the mysql database.

The actual database commands are in two files:

- `createuser.sql`

  This file contains the sql necessary to create a non-root user.

- `createdata.sql`

  This file contains the commands required to create a sample database and a table withing the database. It further inserts a couple of records into the database.

### webserver

This directory contains the files necessary to build the Docker container for the web server.

- `index.php`

  A simple application to print the contents of the database.

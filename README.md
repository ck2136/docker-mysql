docker-mysql
============

A docker image for running a mysql server instance that also supports python and SQLAlchemy.
It is based on the [mysql image](https://registry.hub.docker.com/u/centurylink/mysql/) provided by CenturyLink.

Usage
-----

Run a container exposing port 3306 to the host and changing default root password:

     $ docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mysecretpwd lec00q/mysql

The default workdir is `/tmp/db`.

### Setup a new database schema

You can use python scripts to setup a new schema.

For example, suppose that you have a python script named `dbclasses.py` which exploits SQLAlchemy. That script is in a local directory named `/home/lec00q/database`. Let's mount that directory as a volume:

    $ docker run --name mysql -p 3306:3306 -v /home/lec00q/database:/tmp/db -e MYSQL_DATABASE=mydb lec00q/mysql

Note that we have also created a new database called `mydb`.
While the container is running, you may run the script using `docker exec`:

    $ docker exec mysql python -c "import dbclasses; db_classes.initialize('mydb')"


Environment variables
---------------------

 - `MYSQL_ROOT_PASSWORD`: The password for the root user. Defaults to a blank password
 - `MYSQL_DATABASE`: A database to automatically create. If not provided, does not create a database.
 - `MYSQL_USER`: A user to create that has access to the database specified by `MYSQL_DATABASE`.
 - `MYSQL_PASSWORD`: The password for `MYSQL_USER`. Defaults to a blank password.

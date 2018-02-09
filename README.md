# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version : 2.4.1

* System dependencies: see gem file

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* start DB service: "sudo mongod --dbpath /var/lib/mongodb --auth"
more info: https://docs.mongodb.com/master/tutorial/install-mongodb-on-ubuntu/

* needed ENV_VAR's in development
DNDTABLETOP_DB_DEFAULT_USERNAME,
DNDTABLETOP_DB_DEFAULT_PASSWORD

*needed ENV VAR's in production

DNDTABLETOP_DB_USERNAME,
DNDTABLETOP_DB_NAME,
DNDTABLETOP_DB_PASSWORD

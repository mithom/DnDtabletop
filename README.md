# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version : 2.4.1

This is best done by using RVM (ruby version manager) so you can have different ruby versions for different projects.  
you can get rvm here: http://rvm.io  
'rvm install ruby-2.4.1'

* System dependencies: see gem file  
Gems can easily be managed by a gem called bundler (installed with 'gem install bundler' after ruby is installed) by using 'bundler install'
gems are libraries from ruby.

* Configuration  
You need environment variables, these are defined in sample.env  
An easy way to create these for a project (instead of gloablly) is to make a .env file and declare them there.  
To use this .env file in cmd you can use the npm 'dotenv' package.  
To use .env files in rubymine you can use the EnvFile plugin from rubymine and Select the correct file under 'Edit Confifuration' -> 'EnvFile'

* Database creation  
Default objects for the database must be added, srry for the inconvenience.

* Database initialization  
Just make one and set the correct env variables as described below

* How to run the test suite  
there aren't any yet

* Services (job queues, cache servers, search engines, etc.)  
there aren't any yet

* Deployment instructions

install mongoDB (i think version 3.6.3) as database server.  
a good program to access the database with if you don't like to do this with terminal is the official mongoDB Compass Community


start DB service: "sudo mongod --dbpath /var/lib/mongodb --auth"  
more info: https://docs.mongodb.com/master/tutorial/install-mongodb-on-ubuntu/

You can start the server from rubymine with correct env variables or correct settings or by terminal with 'bin/rails s --environment development' if you have the corrent env settings, or with the .env file using 'dotenv bin/rails s --environment development'
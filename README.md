# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration 


Asume you had instaled docker

add the dump.sql file to root project before run build

`sudo docker-compose build`
`sudo docker-compose up -d`
* Database creation

* Database initialization

`sudo docker-compose run mysql  mysql -u root password="root" dev < dump.sql`

`sudo docker-compose run app rake db:migrate`

if migrate fails  run again
* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

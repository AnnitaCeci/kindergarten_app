# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

2.7.1

* System dependencies

* Configuration 

local:

Asume you have docker instalation

change env in docker compose to development and add  the dump.sql file to root project before run build

`sudo docker-compose build`
`sudo docker-compose up -d`

`sudo docker-compose run mysql  mysql -u root password="root" dev < dump.sql`

`sudo docker-compose run app rake db:migrate`

if migrate fails  run it again


For Heroku:

`heroku container:release web`

`heroku container:release web`

` mysql --host=us-cdbxxxxxxx.com --user=bxxxxxxxx --password=cxxxxxx --reconnect heroku_b84xxxxxxxxx < dump.sql`
wher dump.sql is the initial db

if you dont have mysql installed, you can build locally and then run

`sudo docker-compose run app mysql --host=us-cdbxxxxxxx.com --user=bxxxxxxxx --password=cxxxxxx --reconnect heroku_b84xxxxxxxxx < dump.sql < dump.sql`

`heroku run  rake db:migrate`


if migrate fails  run it again
* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

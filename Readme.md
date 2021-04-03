# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Memo

docker-compose run web rails new . --force --no-deps --database=postgresql --skip-test --webpacker

docker-compose run web rake db:create

docker-compose up

docker-compose exec web bash

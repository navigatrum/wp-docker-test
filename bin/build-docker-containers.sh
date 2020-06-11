#!/usr/bin/env bash

docker-compose up -d wordpress-develop
docker-compose run --rm mysql mysql --version
docker-compose run --rm php php --version
docker-compose run --rm php php -m
docker-compose run --rm phpunit phpunit --version
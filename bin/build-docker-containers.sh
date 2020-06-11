#!/usr/bin/env bash

docker-compose run --rm mysql mysql --version
docker-compose run --rm php php --version
docker-compose run --rm php php -m
docker-compose run --rm phpunit phpunit --version
docker-compose up -d wp-tests
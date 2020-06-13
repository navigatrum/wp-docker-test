# FROM ubuntu:16.04
# WORKDIR /var/www/html
# COPY ./bin/install-wp-tests.sh /var/www/html/install-wp-tests.sh
# RUN /var/www/html/install-wp-tests.sh wordpress_test wp_test_user wp_test_password db:3306 4.2
# https://github.com/Soluto/wordpress-plugin-tests-template/blob/master/Dockerfile
ARG LOCAL_PHP_IMAGE
FROM $LOCAL_PHP_IMAGE
# FROM php:7.4-cli
RUN apt-get update && apt-get install -y --no-install-recommends subversion
WORKDIR /tmp
COPY ./bin/install-wp-tests.sh /tmp/install-wp-tests.sh
RUN chmod +x /tmp/install-wp-tests.sh
ARG PASSWORD
ENV PASSWORD=$PASSWORD
ARG VER
# ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.7.3/wait /wait
# RUN chmod +x /wait
# CMD /wait && echo "db ready"
# RUN until mysql -u root -proot_password -e ";"; do >&2 echo "Can't connect"; sleep 1; done
RUN /tmp/install-wp-tests.sh wordpress_tests wp_test_user wp_test_password db:3306 $VER true
WORKDIR /wordpress
RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
# RUN pecl install xdebug
# RUN docker-php-ext-enable xdebug
RUN composer require phpunit/phpunit "^7"

# RUN composer install
COPY . /wordpress


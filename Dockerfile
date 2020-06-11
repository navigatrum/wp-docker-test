# FROM ubuntu:16.04
# WORKDIR /var/www/html
# COPY ./bin/install-wp-tests.sh /var/www/html/install-wp-tests.sh
# RUN /var/www/html/install-wp-tests.sh wordpress_test wp_test_user wp_test_password db:3306 4.2
FROM php:7.3-fpm
RUN apt-get install -y --no-install-recommends subversion
COPY ./bin/install-wp-tests.sh /var/www/html/install-wp-tests.sh
RUN /var/www/html/install-wp-tests.sh wordpress_test wp_test_user wp_test_password db:3306 4.2

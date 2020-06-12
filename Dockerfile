# FROM ubuntu:16.04
# WORKDIR /var/www/html
# COPY ./bin/install-wp-tests.sh /var/www/html/install-wp-tests.sh
# RUN /var/www/html/install-wp-tests.sh wordpress_test wp_test_user wp_test_password db:3306 4.2
# https://github.com/Soluto/wordpress-plugin-tests-template/blob/master/Dockerfile
ARG LOCAL_PHP_IMAGE
FROM $LOCAL_PHP_IMAGE
RUN apt-get update && apt-get install -y --no-install-recommends subversion
COPY ./bin/install-wp-tests.sh /app/install-wp-tests.sh
RUN chmod +x /app/install-wp-tests.sh
ARG PASSWORD
ENV PASSWORD=$PASSWORD
ARG VER
RUN /app/install-wp-tests.sh wordpress_tests root $PASSWORD db $VER true



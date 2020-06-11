# FROM ubuntu:16.04
# WORKDIR /var/www/html
# COPY ./bin/install-wp-tests.sh /var/www/html/install-wp-tests.sh
# RUN /var/www/html/install-wp-tests.sh wordpress_test wp_test_user wp_test_password db:3306 4.2
FROM wordpress:4.2
RUN apk add --update subversion curl && rm -rf /var/cache/apk/*
COPY ./bin/install-wp-tests.sh /var/www/html/install-wp-tests.sh
RUN /var/www/html/install-wp-tests.sh wordpress_test wp_test_user wp_test_password db:3306 4.2

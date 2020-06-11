FROM wordpress:3.4
WORKDIR /var/www/html
COPY ./bin/install-wp-tests.sh /var/www/html/install-wp-tests.sh
RUN /var/www/html/install-wp-tests.sh wordpress_test wp_test_user wp_test_password db:3306 3.4
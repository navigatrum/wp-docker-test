# FROM ubuntu:16.04
# WORKDIR /var/www/html
# COPY ./bin/install-wp-tests.sh /var/www/html/install-wp-tests.sh
# RUN /var/www/html/install-wp-tests.sh wordpress_test wp_test_user wp_test_password db:3306 4.2
ARG LOCAL_PHP_IMAGE
FROM $LOCAL_PHP_IMAGE
RUN apt-get update && apt-get install -y --no-install-recommends subversion
COPY ./bin/install-wp-tests.sh /var/www/html/install-wp-tests.sh
RUN chmod +x /var/www/html/install-wp-tests.sh
ARG DATABASE
ENV DATABASE=$DATABASE
ARG USER
ENV USER=$USER
ARG PASSWORD
ENV PASSWORD=$PASSWORD
ARG HOST
ENV HOST=$HOST
ARG VER
ENV VER=$VER
RUN /var/www/html/install-wp-tests.sh $DATABASE $USER $PASSWORD $HOST $VER
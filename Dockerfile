FROM php:7.1.11-fpm

ENV APP_HOME /moodle
ENV MOODLE_DATA /moodle-data
ENV MOODLE_VERSION v3.3.2

RUN apt-get update && \
    apt-get install -y aspell graphviz curl libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libcurl4-openssl-dev libicu-dev libldb-dev libldap2-dev libxml2-dev libpspell-dev libpq-dev nginx supervisor && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install -j$(nproc) curl gd intl ldap pspell xml xmlrpc zip pdo_pgsql pgsql && \
    mkdir -p $APP_HOME && curl -L https://github.com/moodle/moodle/archive/$MOODLE_VERSION.tar.gz | tar xz -C $APP_HOME --strip 1 && chown -R www-data:www-data $APP_HOME && \
    mkdir -p $MOODLE_DATA && chown -R www-data:www-data $MOODLE_DATA && chmod -R 777 $MOODLE_DATA

COPY site.conf /etc/nginx/sites-available/default
COPY www.conf /usr/local/etc/php-fpm.d/www.conf
COPY supervisord.conf /etc/supervisord.conf

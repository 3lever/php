ARG PHP_VERSION

FROM php:$PHP_VERSION as base

RUN apt-get update

RUN apt-get install -y libpq-dev libzip-dev zlib1g-dev libicu-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-configure intl \
    && docker-php-ext-install pdo pdo_pgsql pgsql zip intl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

FROM base as base-postgresql
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

FROM base as base-mysql
RUN docker-php-ext-install pdo_mysql
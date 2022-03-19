ARG PHP_VERSION
ARG BASE_SUFIX


FROM php:${PHP_VERSION} as base

RUN apt-get update

RUN apt-get install -y libpq-dev libzip-dev zlib1g-dev libicu-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-configure intl \
    && docker-php-ext-install pdo pdo_pgsql pgsql zip intl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

FROM base as base-dev

VOLUME /var/run/docker.sock:/var/run/docker.sock:ro

RUN apt-get install -y git wget
RUN pecl install xdebug && docker-php-ext-enable xdebug
RUN curl https://cli-assets.heroku.com/install.sh | sh
RUN apt-get -y install docker.io

#Nodejs and Yarn, It'll help some fullstack projects
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash - \
    && apt-get install -y nodejs \
    && npm install --global yarn

FROM base${BASE_SUFIX} as base-postgresql
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

FROM base${BASE_SUFIX} as base-mysql
RUN docker-php-ext-install pdo_mysql
FROM php:7.4.4-fpm

WORKDIR /var/www

COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

RUN apt update && apt install -y zip unzip wget zlib1g-dev libicu-dev

RUN docker-php-ext-install pdo_mysql intl opcache

COPY ./composer.json .
COPY ./composer.lock .

RUN composer install --no-progress --no-scripts

RUN composer validate

COPY . .

RUN composer run-script post-autoload-dump
RUN composer run-script post-root-package-install


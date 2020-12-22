FROM php:7.4.4-fpm

COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

ARG USER_ID

RUN useradd -s /bin/bash -d /home/user/ -m -G sudo,www-data user -u ${USER_ID}

RUN apt update && apt install -y zip unzip wget zlib1g-dev libicu-dev git

RUN docker-php-ext-install pdo_mysql intl opcache

USER user

ENV PATH="/home/user/.symfony/bin:${PATH}"

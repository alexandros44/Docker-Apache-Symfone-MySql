FROM php:7.3.0-apache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get update  && apt-get install -y libzip-dev git unzip \
    && docker-php-ext-install zip mysqli pdo pdo_mysql

COPY . /var/www/html

WORKDIR /var/www/html/app

RUN composer install

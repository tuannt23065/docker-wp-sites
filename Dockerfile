FROM php:8.0-apache

COPY ./apache-container/apache.conf /etc/apache2/sites-available/000-default.conf

# Copy custom PHP configuration
COPY ./apache-container/php-config/php.ini /usr/local/etc/php/

# Install necessary PHP extensions and other dependencies
RUN apt-get update && apt-get install -y \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libpng-dev \
	libonig-dev \
	libzip-dev \
	zip \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& docker-php-ext-install -j$(nproc) gd \
	&& docker-php-ext-install -j$(nproc) mysqli \
	&& docker-php-ext-install -j$(nproc) pdo pdo_mysql \
	&& docker-php-ext-install -j$(nproc) mbstring \
	&& docker-php-ext-install -j$(nproc) zip \
	&& docker-php-ext-install -j$(nproc) opcache \
	&& apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN a2enmod rewrite

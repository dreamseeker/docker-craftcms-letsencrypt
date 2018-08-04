FROM php:7.2-apache

#
# PHP Configuration
#
# install PHP modules
# ----------
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        nano \
        libicu-dev \
        zlib1g-dev \
        wget \
        unzip \
    && docker-php-ext-install intl \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql


# install GD
# ----------
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-install gd


# install Imagemagick & PHP Imagick ext
# ----------
RUN apt-get install -y \
        libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick


# cleanup
# ----------
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# enable mod_rewite
# ----------
RUN a2enmod rewrite

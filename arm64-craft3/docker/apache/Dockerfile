FROM arm64v8/php:7.4-apache

#
# PHP Configuration
#
# install PHP modules
# ----------
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        nano \
        libicu-dev \
        libzip-dev \
        wget \
        zip \
        unzip \
        sudo \
        git \
        imagemagick \
    && docker-php-ext-install intl \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install opcache


# install GD
# ----------
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libwebp-dev \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ --with-webp=/usr/include/ \
    && docker-php-ext-install gd


# install Imagemagick & PHP Imagick ext
# ----------
RUN apt-get install -y --no-install-recommends \
        libmagickwand-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick


# install BCMath & GMP for Freeform plugin
# ----------
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libgmp-dev \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install gmp


# install MySQL CLI
# ----------
RUN apt-get update \
    && apt-get install -y \
        default-mysql-client


# install Xdebug
# ----------
RUN pecl install xdebug \
      && docker-php-ext-enable xdebug


# cleanup
# ----------
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# enable mod_rewite
# ----------
RUN a2enmod rewrite


# install composer
# ----------
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

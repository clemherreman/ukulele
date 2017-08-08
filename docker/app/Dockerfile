FROM php:7.0-apache

RUN apt-get update && apt-get install -y \
    git \
    zip \
    libicu-dev

RUN docker-php-ext-install pdo pdo_mysql


COPY app.ini /usr/local/etc/php/conf.d/

#### -- From docker wp library
RUN set -ex && apt-get update && apt-get install -y libjpeg-dev libpng12-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd mysqli opcache \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl
#### -- From docker wp library

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini

COPY app.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer \
    && chmod +x /usr/local/bin/composer

RUN mkdir -p /var/lib/php/sessions && chown -R www-data /var/lib/php && chmod -R 775 /var/lib/php/sessions

# WORKDIR /var/www/html

EXPOSE 80
CMD ["apache2-foreground"]
ENTRYPOINT ["docker-php-entrypoint"]

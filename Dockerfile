FROM php:8.2-fpm

ARG USER
ARG USER_ID
ARG GROUP_ID

WORKDIR /var/www

RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    curl \
    vim \
    libicu-dev

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash \
    && apt-get install nodejs -y

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-configure intl
RUN docker-php-ext-install pdo pdo_mysql intl

RUN groupadd --force -g $GROUP_ID $USER
RUN useradd -ms /bin/bash --no-user-group -g $GROUP_ID -u 1337 $USER
RUN usermod -u $USER_ID $USER

USER $USER

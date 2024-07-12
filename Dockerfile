FROM php:8.1-cli

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    libzip-dev \
    unzip \
    && docker-php-ext-install zip


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer --version

COPY composer.json composer.lock* ./

COPY . .

# RUN composer install
# CMD [ "vendor/bin/phpunit", "tests" ]
# CMD [ "ls", "-lat" ]

CMD [ "php", "-S", "0.0.0.0:80", "-t", "/app" ]

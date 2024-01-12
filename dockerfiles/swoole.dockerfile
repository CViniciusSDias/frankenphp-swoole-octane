FROM php:8.3-alpine
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

WORKDIR /app
RUN install-php-extensions pcntl sockets swoole pdo_pgsql
COPY . /app

ENTRYPOINT ["php", "artisan", "octane:start", "--server=swoole", "--port=9802", "--workers=16", "--host=0.0.0.0"]

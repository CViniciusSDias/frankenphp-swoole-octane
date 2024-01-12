FROM dunglas/frankenphp

WORKDIR /app
RUN install-php-extensions pcntl sockets pdo_pgsql
COPY . /app

ENTRYPOINT ["php", "artisan", "octane:start", "--server=frankenphp", "--port=9804", "--workers=16", "--host=0.0.0.0"]

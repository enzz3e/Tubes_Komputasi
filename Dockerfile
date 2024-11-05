# Menggunakan php 8.2
FROM php:8.2-apache

# Install ekstensi mysqli
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Salin semua file dan folder ke dalam direktori root Apache
COPY . /var/www/html/

# Mengatur hak akses
RUN chown -R www-data:www-data /var/www/html

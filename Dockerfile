# Gunakan image PHP dengan Apache
FROM php:8.2-apache

# Install ekstensi yang diperlukan
RUN docker-php-ext-install mysqli

# Salin semua file dan folder ke dalam direktori root Apache
COPY . /var/www/html/

# Atur hak akses
RUN chown -R www-data:www-data /var/www/html

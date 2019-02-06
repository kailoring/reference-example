FROM php:apache

# Install the mysql interface
WORKDIR /var/www/html
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Copy the web application into the web root directory
COPY index.php/ /var/www/html/

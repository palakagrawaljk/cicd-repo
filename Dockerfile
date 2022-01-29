FROM devopsedu/webapp:latest
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin
RUN a2enmod rewrite
#RUN apt-get install -y php apache2
COPY website.war /var/www/html/
sudo chmod -R 775 /var/www/html/
CMD ["start-apache"]

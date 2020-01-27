################################################################################

###############
# INFORMATION #
###############

# 1 :
# We use here more apt-get than apt because apt is more visual
# (that's why it is not recommended to be used by scripts).
# Apt-get is a more "low level" tool, which allows some operations 
# less common than those proposed by apt.
# 2 :
# The -y is for the "y/n" (yes or no) when we install or used an order

################################################################################

###############################
# UPDATE AND INSTALL PACKAGES #
###############################

apt-get update

apt-get upgrade -y

# For install NGINX (check at the end of the script for the definition)
apt-get install nginx -y

# For install MARIADB-SERVEUR
# (check at the end of the script for the definition)
apt-get install  mariadb-server mariadb-client -y

# For install WGET (check at the end of the script for the definition)
apt-get install wget debconf debconf-utils zip unzip -y

# For install PHP (check at the end of the script for the definition)
apt-get install php -y
# We don't need apache2
apt-get purge -y apache2

# Install this extension of php for PhpMyAdmin
apt-get install php-cli php-mysql php-cgi php-fpm php-mbstring -y

# For download SSL 
apt-get install libnss3-tools -y
apt-get install mkcert -y


################################################################################

#################
# NGINXNX SETUP #
#################
cd
#mkdir -p /var/www/localhost
cp /root/server.conf /etc/nginx/sites-available
ln -s /etc/nginx/sites-available/server.conf /etc/nginx/sites-enabled/

chmod 755 -R /var/www/html
chown -R www-data: /var/www/html
#cp /etc/nginx /var/www/html/
############
# DATABASE #
############

service mysql start
mysql --user=root -e "CREATE DATABASE wordpress;"
mysql --user=root -e "CREATE USER 'loamar'@'localhost' IDENTIFIED BY 'password';"
mysql --user=root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'loamar'@'localhost';"
mysql --user=root -e "FLUSH PRIVILEGES;"
mysql --user=root -e "UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user='loamar';"

# CREATE USER '$USERNAME'@localhost IDENTIFIED BY '$PASSWORD';
# GRANT ALL PRIVILEGES ON wordpress.* TO '$USERNAME'@'localhost';
# UPDATE mysql.user SET authentication_string = '' WHERE user = 'root';
# UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user='root';
# FLUSH PRIVILEGES;"

# Upload our wordpress site database downloaded from https://localhost/phpmyadmin/db_export.php?db=wordpress
mysql wordpress -u root --password=  < wordpress.sql

#############
# WORDPRESS #
#############

cd
wget https://wordpress.org/latest.zip
mv wordpress.zip wordpress.zip
unzip -q latest.zip -d /var/www/html
rm -rf latest.zip

# load our account config
cp /root/wp-config.php /var/www/html/wordpress/.

##############
# PHPMYADMIN #
##############

cd /var/www/html
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar xzf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages phpmyadmin
rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz

# Own config file
cp /root/config.inc.php /var/www/html/phpmyadmin/.
chmod 777 /var/www/html/phpmyadmin/tmp

# https://askubuntu.com/questions/387062/how-to-solve-the-phpmyadmin-not-found-issue-after-upgrading-php-and-apache
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

###############
# CERTIFICATE #
###############

mkdir ~/mkcert && cd ~/mkcert
wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64
mv mkcert-v1.1.2-linux-amd64 mkcert && chmod +x mkcert
./mkcert -install
./mkcert localhost

# For Put the html index
cp /root/index.html /var/www/html
# For put welcome page Nginx
mkdir /var/www/html/nginx
cp -r /var/www/html/index.nginx-debian.html /var/www/html/nginx

#########
# START #
#########

/etc/init.d/php7.3-fpm start
service nginx restart

################################################################################

##############
# DEFINITION #
##############

# NGINX (https://www.webopedia.com › TERM › nginx) :
# Nginx is a high performance web server and very popular these days.
# Nginx is an open source HTTP Web server and reverse proxy server.

# WGET (https://doc.ubuntu-fr.org/wget) :
# Wget is a non-interactive command line program for downloading files 
# from the web. It supports HTTP, HTTPS and FTP protocols as well 
# as downloading through HTTP proxies.
# Useful because it does not require user action and allows you to perform 
# its tasks in the background, which can be very useful for large and heavy
# data downloads. So you can switch sessions and let Wget finish the job.

# MARIADB :
# More community and open, and 100% compatible MySQL.
# It is also more efficient according to some studies.
# It is used as the default MySQL server on Debian.

# Mysql (https://doc.ubuntu-fr.org/mysql) :
# MySQL is primarily a database server.
# To connect locally or remotely, a client is used.
# It can be the mysql command, or commonly a PHP script.
# It will be necessary in this case to install The
# php-mysql module which allows PHP to communicate with a MySQL server.

# Php :
# Generalist and open source scripting language,
# specially designed for web application development.
# It can be easily integrated with HTML.

# Wordpress :
# WordPress is a free, free and open-source content management system (CMS).

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
# 3 :
# 

################################################################################

###############################
# UPDATE AND INSTALL PACKAGES #
###############################

# Download for each source of packets the corresponding Packages 
# (or Sources) file
apt-get update

# This command looks for updates to installed packages 
# that can be made without removing packages.
apt-get upgrade -y

# For install NGINX (check at the end of the script for the definition)
apt install nginx -y

# For install WGET (check at the end of the script for the definition)
apt-get -y install wget

# For install MARIADB-SERVEUR
# (check at the end of the script for the definition)
apt-get -y install mariadb-server

apt -y install php-{mbstring,zip,gd,xml,pear,gettext,cli,fpm,cgi}

################################################################################

chown www-data:www-data /usr/share/nginx/html/ -R



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

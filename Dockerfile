FROM debian:buster

MAINTAINER MickeyMighty
COPY srcs/server.conf ./root/
COPY srcs/wordpress.sql ./root/
COPY srcs/startme.sh .
COPY srcs/config.inc.php ./root/
COPY srcs/wp-config.php ./root/
COPY srcs/index.html ./root/
COPY srcs/README .

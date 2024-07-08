FROM ubuntu:22.04
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y &&  DEBIAN_FRONTEND=noninteractive apt-get install -q -y apache2 telnet
RUN mkdir -p /var/run/apache2 /var/lock/apache2
RUN a2enmod proxy proxy_http ssl rewrite headers
RUN a2enmod authnz_ldap
RUN a2enmod session session_cookie session_crypto
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
 
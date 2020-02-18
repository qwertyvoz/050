FROM ubuntu

RUN apt-get update
RUN apt-get -y install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl curl apache2

ENV WORDPRESS_VERSION 5.3.2
ENV WORDPRESS_SHA1 fded476f112dbab14e3b5acddd2bcfa550e7b01b
EXPOSE 80
RUN set -ex; \
	curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz"; \
	echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c -; \
# upstream tarballs include ./wordpress/ so this gives us /usr/src/wordpress
	tar -xzf wordpress.tar.gz -C /usr/src/; \
	rm wordpress.tar.gz; \
	chown -R www-data:www-data /usr/src/wordpress
CMD ["apachectl", "-D", "FOREGROUND"]

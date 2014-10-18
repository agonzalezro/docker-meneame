FROM tutum/lamp:latest

MAINTAINER Alex Gonzalez <agonzalezro@gmail.com>

RUN sed -i "s/short_open_tag = Off/short_open_tag = On/g" /etc/php5/apache2/php.ini

RUN rm -rf /app
RUN git clone https://github.com/gallir/Meneame.git /tmp/meneame
RUN mv /tmp/meneame/branches/version5/www /app
RUN mv /tmp/meneame/branches/version5/scripts /

ADD config.php /app/config.php
ADD scripts/run.sh /run.sh
ADD scripts/restore_meneame_dump.sh /restore_meneame_dump.sh
RUN chmod a+x /run.sh /restore_meneame_dump.sh

# Workarounds
RUN ln -s /app /app/v_16

EXPOSE 80 3306
CMD ["/run.sh"]

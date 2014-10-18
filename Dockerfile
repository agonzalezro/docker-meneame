FROM tutum/lamp:latest

RUN rm -rf /app
RUN git clone https://github.com/gallir/Meneame.git /tmp/meneame
RUN mv /tmp/meneame/branches/version5/www /app
RUN mv /tmp/meneame/branches/version5/scripts /

ADD config.php /app/config.php
ADD scripts/run.sh /run.sh
ADD scripts/restore_meneame_dump.sh /restore_meneame_dump.sh
RUN chmod a+x /run.sh /restore_meneame_dump.sh

EXPOSE 80 3306
CMD ["/run.sh"]

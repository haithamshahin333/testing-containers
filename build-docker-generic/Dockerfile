FROM owasp/zap2docker-live

USER root

COPY uid.sh /usr/local/bin/uid.sh
RUN chmod 755 /usr/local/bin/uid.sh

RUN chown root:root /home/zap -R && \
    chmod 777 /home/zap -R && \
    chown root:root /etc/passwd && \
    chmod 660 /etc/passwd

USER 1007

ENTRYPOINT ["/usr/local/bin/uid.sh"]
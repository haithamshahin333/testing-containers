FROM owasp/zap2docker-live

USER root

# COPY uid.sh /usr/local/bin/uid.sh
RUN chmod 755 /usr/local/bin/uid.sh

RUN chown root:root /home/zap -R && \
    chmod 777 /home/zap -R && \
    chown root:root /etc/passwd && \
    chmod 660 /etc/passwd

USER 1007

zap.sh -daemon -host 0.0.0.0 -port 8080 -config api.disablekey=true -config api.addrs.addr.regex=true -config api.addrs.addr.name=.*

# ENTRYPOINT ["/usr/local/bin/uid.sh"]
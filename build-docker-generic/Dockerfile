FROM owasp/zap2docker-live

USER root

RUN chown root:root /zap -R && \
    chmod 777 /zap -R

USER zap

CMD zap.sh -daemon -host 0.0.0.0 -port 8080 -config api.disablekey=true -config api.addrs.addr.regex=true -config api.addrs.addr.name=.*
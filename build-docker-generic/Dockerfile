FROM registry.access.redhat.com/rhel7

USER root

LABEL com.redhat.component="jenkins-slave-zap-rhel7-docker" \
      name="openshift3/jenkins-slave-zap-rhel7" \
      version="3.9" \
      architecture="x86_64" \
      release="1" \
      io.k8s.display-name="Jenkins Slave ZAProxy" \
      io.k8s.description="The jenkins slave zap image is Zed Attack Proxy on top of the Jenkins slave base RHEL7" \
      io.openshift.tags="openshift,jenkins,slave,zap"

WORKDIR /zap

RUN yum install -y java-1.8.0-openjdk-devel && \ 
    yum clean all && \ 
    rm -rf /var/cache/yum

COPY uid.sh /usr/bin/uid.sh

RUN mkdir -p /zap/wrk && curl -L -s https://raw.githubusercontent.com/zaproxy/zap-admin/master/ZapVersions-dev.xml | \
    grep Linux | grep url | sed 's@^\s*<url>\([^<]*\)</url>.*$@\1@g' | \
    xargs -I {} -n 1 curl -L -o zaproxy.tar.gz {} && \
    tar --strip-components=1 -xzf zaproxy.tar.gz && \
    touch AcceptedLicense && \
    chown root:root /zap -R && \
    chown root:root /etc/passwd && \
    chmod 660 /etc/passwd && \
    chown root:root /usr/bin/uid.sh && \
    chmod 755 /usr/bin/uid.sh && \
    chmod 777 /zap -R

ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk/bin
ENV PATH=/usr/lib/jvm/jre-1.8.0-openjdk/bin:/zap:$PATH
ENV ZAP_PATH=/zap/zap.sh
ENV ZAP_PORT=8080

EXPOSE 8080
USER 1001

ENTRYPOINT ["/usr/bin/uid.sh"]
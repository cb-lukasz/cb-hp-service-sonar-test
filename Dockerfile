
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG ARTEFACT_VERSION
ARG SETUP_TYPE
ARG REGION
ARG REGION_ID
ARG ENVIRONMENT_DOMAIN
ARG BUILD_USER=build
ARG BUILD_USER_HOME_DIR=/home/$BUILD_USER

ENV REGION=${REGION}
ENV REGION_ID=${REGION_ID}
ENV SETUP_TYPE=${SETUP_TYPE}
ENV ARTEFACT_VERSION=${ARTEFACT_VERSION}

ENV ENVIRONMENT_DOMAIN=${ENVIRONMENT_DOMAIN}

COPY build/libs/cb-hp-service-${ARTEFACT_VERSION}.jar /opt/app.jar

COPY scripts/ /opt/scripts

COPY crt /opt/crt

RUN yum update -y

RUN  mkdir -p $BUILD_USER_HOME_DIR/crt && \
    cp -R /opt/crt $BUILD_USER_HOME_DIR/ && \
    chown -R $BUILD_USER.$BUILD_USER $BUILD_USER_HOME_DIR && \
    chown $BUILD_USER.$BUILD_USER $BUILD_USER_HOME_DIR/crt/key.pem $BUILD_USER_HOME_DIR/crt/server.pem $BUILD_USER_HOME_DIR/crt/ngc.p12 && \
    chmod -R 550 $BUILD_USER_HOME_DIR/crt

RUN mkdir -p /var/log/tomcat_logs && \
    mkdir -p /var/log/app_access_logs && \
    chown  tomcat:tomcat /var/log/tomcat_logs && \
    chown  tomcat:tomcat /var/log/app_access_logs


RUN mkdir -p /home/build/prod_builds/cb-hp-service/bin  && \
    mkdir -p /home/build/prod_builds/cb-hp-service/lib && \
    mkdir -p /home/build/prod_builds/cb-hp-service/scripts && \
    cp /opt/app.jar /home/build/prod_builds/cb-hp-service/bin/app.jar && \
    cp /opt/scripts/start_app.sh /home/build/prod_builds/cb-hp-service/scripts/start_app.sh && \
    chown -R build.tomcat /home/build/prod_builds/cb-hp-service/*  && \
    chmod 550  /home/build/prod_builds/cb-hp-service/scripts/start_app.sh && \
    chmod 550  /home/build/prod_builds/cb-hp-service/bin/app.jar && \
    rm -rf /opt/*

USER tomcat
VOLUME ["/var/log/tomcat_logs","/var/log/app_access_logs"]
ENTRYPOINT ["./home/build/prod_builds/cb-hp-service/scripts/start_app.sh"]


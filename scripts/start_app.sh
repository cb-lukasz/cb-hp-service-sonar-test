#!/bin/bash

BUILD_HOME_PATH=/home/build/prod_builds/cb-hp-service/

SPRING_BOOT_OPTIONS="-Dspring.profiles.active=${SETUP_TYPE}"
SPRING_BOOT_OPTIONS="${SPRING_BOOT_OPTIONS} -Dchargebee.environment.region.id=$REGION_ID"
SPRING_BOOT_OPTIONS="${SPRING_BOOT_OPTIONS} -Dchargebee.environment.region.name=$REGION"
SPRING_BOOT_OPTIONS="${SPRING_BOOT_OPTIONS} -Dchargebee.environment.name=${SETUP_TYPE}"
SPRING_BOOT_OPTIONS="${SPRING_BOOT_OPTIONS} -Dchargebee.environment.domain=$ENVIRONMENT_DOMAIN"
SPRING_BOOT_OPTIONS="${SPRING_BOOT_OPTIONS} -Dchargebee.environment.type=$SETUP_TYPE"

java -jar ${SPRING_BOOT_OPTIONS} $BUILD_HOME_PATH/bin/app.jar

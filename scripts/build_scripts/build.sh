#!/bin/bash
set -eu

main() {
  createDirs $*
  getSecrets $*
  generateCerts $*
}
createDirs() {
  mkdir -p $CODEBUILD_SRC_DIR/crt
}

getSecrets() {
  SECRET="$SETUP_TYPE/${REGION_ID}/cb-hp-service/ssl-password"
  PASSWORD=$(aws secretsmanager --region $REGION get-secret-value --secret-id $SECRET --query SecretBinary --output text | base64 -d | base64 -d)
}

generateCerts() {
    if [ "$SETUP_TYPE" = "infra" ]; then
      DOMAIN="cb-infra.com"
    elif [ "$SETUP_TYPE" = "dev" ]; then
      DOMAIN="devcb.in"
    elif [ "$SETUP_TYPE" = "staging" ]; then
      DOMAIN="stagingcb.com"
    elif [ "$SETUP_TYPE" = "prod" ]; then
      DOMAIN="chargebee.com";  fi

    openssl req -newkey rsa:2048 \
      -new -nodes -x509 \
      -days 1825 \
      -keyout $CODEBUILD_SRC_DIR/crt/key.pem \
      -out $CODEBUILD_SRC_DIR/crt/server.pem \
      -subj "/C=US/ST=CA/L=San Francisco /O=Chargebee /OU=CB /CN=*.${DOMAIN} /emailAddress=aws@chargebee.com"

    openssl pkcs12 -export -in $CODEBUILD_SRC_DIR/crt/server.pem \
    -inkey $CODEBUILD_SRC_DIR/crt/key.pem \
    -out $CODEBUILD_SRC_DIR/crt/ngc.p12 \
    -name "ngc" \
    -password pass:$PASSWORD
}


main $*


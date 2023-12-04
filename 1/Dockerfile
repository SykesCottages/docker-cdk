ARG ARCH=amd64
FROM sykescottages/cdk:base-$ARCH

RUN npm install -g aws-cdk@1.203.0

COPY entrypoint /usr/local/bin/

ENTRYPOINT [ "entrypoint" ]
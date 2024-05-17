ARG ARCH=amd64
FROM sykescottages/cdk:base-$ARCH

RUN npm install -g aws-cdk@2.142.1

COPY entrypoint /usr/local/bin/

ENTRYPOINT [ "entrypoint" ]

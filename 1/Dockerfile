FROM sykescottages/cdk:base

RUN npm install -g aws-cdk@1.175.0

COPY entrypoint /usr/local/bin/

ENTRYPOINT [ "entrypoint" ]
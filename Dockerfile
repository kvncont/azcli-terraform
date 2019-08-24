FROM alpine:3.10

ARG VERSION=0.12.7

RUN apk update && apk add --no-cache wget unzip bash py-pip \
&& apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python-dev make \
&& wget https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip \
&& unzip terraform_${VERSION}_linux_amd64.zip \
&& mv terraform /usr/local/bin \
&& rm terraform_${VERSION}_linux_amd64.zip \
&& pip install azure-cli \
&& apk del --purge build

CMD [ "/bin/bash" ]

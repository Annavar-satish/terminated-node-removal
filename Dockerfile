FROM alpine:3.2

WORKDIR /root

RUN apk update && apk upgrade && apk add curl vim

RUN curl -kLO "https://dl.k8s.io/release/$(curl -L -s -k https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    kubectl version --client

COPY . .

ENTRYPOINT [ "./script.sh" ]

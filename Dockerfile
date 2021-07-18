FROM debian:buster-slim

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install --no-install-recommends -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
 && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
 && echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" > /etc/apt/sources.list.d/coral-edgetpu.list \
 && apt-get update \
 && apt-get install edgetpu-compiler \

WORKDIR /home/edgetpu-compiler

ENTRYPOINT ["edgetpu_compiler"]
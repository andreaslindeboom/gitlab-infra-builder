FROM debian:stretch-slim

RUN apt-get update -y && \
    apt-get install -y gnupg && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install -y git ansible ruby ruby-dev curl && \
    gem install serverspec && \
    gem install kitchen-terraform --version 3.1.0 && \
    git clone https://github.com/kamatama41/tfenv.git /opt/tfenv && \
    ln -s /opt/tfenv/bin/* /usr/local/bin && \
    rm -rf /var/lib/apt/lists/*

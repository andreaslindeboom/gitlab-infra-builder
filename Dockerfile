FROM debian:stretch-slim

ENV PATH="$HOME/.tfenv/bin:$PATH"

RUN apt-get update -y && \
    apt-get install -y gnupg && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install -y git ansible ruby ruby-dev && \
    gem install serverspec && \
    git clone https://github.com/kamatama41/tfenv.git ~/.tfenv && \
    rm -rf /var/lib/apt/lists/*

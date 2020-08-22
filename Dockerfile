FROM ruby:latest
MAINTAINER Lex White <t7k312@gmail.com>

# Variables
ENV SSH_KEY="" \
    TIMEOUT="300"

# Install depencies
RUN gem install r10k

# Configure SSH-client
RUN echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config

# ENTRYPOINT
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

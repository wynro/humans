FROM ubuntu:16.04
LABEL maintainer "guillerobles1995@gmail.com"

# Install the necessary packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
                    coreutils \
                    python \
                    pdfgrep \
                    sqlite3 \
                    curl \
                    openssh-client \
                    sed \
                    grep \
                    bsdmainutils \
                    libc-bin \
                    git \
                    && \
    apt-get clean autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/{apt,dpkg,cache,log}

COPY schema.sql schema.sql
COPY humans-get-sources humans-get-sources
COPY humans-load humans-load
COPY docker-script.sh docker-script.sh

CMD ["./docker-script.sh"]

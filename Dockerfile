FROM multiarch/debian-debootstrap:armhf-jessie
ADD sources.list /etc/apt/sources.list
RUN set -x && \
    apt-get update && \
    apt-get install -y -t sid \
        kernel-package
RUN apt-get install -y git-core
ADD Makefile.patch /usr/lib/build-it.sh/Makefile.patch
ADD build-it.sh /usr/bin/build-it.sh
RUN mkdir /src
WORKDIR /src
VOLUME /output
ENV ARCH arm

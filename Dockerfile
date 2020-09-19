FROM node:10-alpine3.11 AS build

RUN apk add --update\
            git \
            make \
            cmake \
            gcc \
            g++ \
            libmad-dev \
            libid3tag-dev \
            libsndfile-dev \
            gd-dev \
            boost-dev \
            libgd \
            libpng-dev \
            zlib-dev \
            zlib-static \
            libpng-static \
            boost-static \
            autoconf \
            automake \
            libtool \
            gettext

RUN wget https://github.com/xiph/flac/archive/1.3.3.tar.gz && \
    tar xzf 1.3.3.tar.gz && \
    cd flac-1.3.3/ && \
    ./autogen.sh && \
    ./configure --enable-shared=no && \
    make && \
    make install

RUN git clone https://github.com/bbc/audiowaveform.git && \
    mkdir audiowaveform/build/ && \
    cd audiowaveform/build/ && \
    cmake -D ENABLE_TESTS=0 -D BUILD_STATIC=1 .. && \
    make

RUN git clone https://github.com/spacedeck/spacedeck-open /spacedeck

FROM node:10-alpine3.11

ARG BUILD_VERSION
ARG BUILD_REVISION
ARG BUILD_DATE

LABEL maintainer="Akito <the@akito.ooo>"
LABEL org.opencontainers.image.authors="Akito <the@akito.ooo>"
LABEL org.opencontainers.image.vendor="Akito"
LABEL org.opencontainers.image.version="${BUILD_VERSION}"
LABEL org.opencontainers.image.revision="${BUILD_REVISION}"
LABEL org.opencontainers.image.created="${BUILD_DATE}"
LABEL org.opencontainers.image.title="Spacedeck"
LABEL org.opencontainers.image.description="Docker image for Spacedeck. \
  Official Docker image is expected to be built on demand and its image architecture is not good, \
  therefore this image is there to fill the gap of the missing Spacedeck Docker image."
LABEL org.opencontainers.image.url="https://hub.docker.com/r/akito13/spacedeck"
LABEL org.opencontainers.image.documentation="https://doc.akito.ooo/books/home/page/setting-up-a-spacedeck-server"
LABEL org.opencontainers.image.source="https://github.com/theAkito/docker-spacedeck"
LABEL org.opencontainers.image.licenses="GPL-3.0+"

RUN apk add --update \
    graphicsmagick \
    ffmpeg \
    ffmpeg-dev \
    ghostscript

WORKDIR /app

COPY --from=build /audiowaveform/build/audiowaveform /usr/local/bin/audiowaveform
COPY --from=build /spacedeck/package*.json /app
RUN npm install
COPY --from=build /spacedeck /app
RUN rm -fr /tmp/* /var/tmp/* /var/cache/*/*

EXPOSE 9666

ENTRYPOINT [ "/usr/local/bin/node" ]
CMD [ "spacedeck.js" ]

FROM alpine:latest

ENV HUGO_VERSION 0.37.1
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-64bit

RUN \
	apk -Uuv add groff make less python py-pip py-pygments bash && \
	pip install awscli && \
	apk --purge -v del py-pip && \
	rm /var/cache/apk/*

# Download and install Hugo
RUN mkdir /usr/local/hugo
ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz /usr/local/hugo/
RUN tar xzf /usr/local/hugo/${HUGO_BINARY}.tar.gz -C /usr/local/hugo/ \
	&& ln -s /usr/local/hugo/hugo /usr/local/bin/hugo \
	&& rm /usr/local/hugo/${HUGO_BINARY}.tar.gz

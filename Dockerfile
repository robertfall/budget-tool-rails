FROM ruby:2.3.3-alpine

ADD Gemfile* /app/

RUN apk --update add nodejs postgresql-dev

RUN apk --update add --virtual build-dependencies build-base ruby-dev openssl-dev \
    libc-dev linux-headers && \
    gem install bundler && \
    cd /app ; bundle install && \
    apk del build-dependencies


WORKDIR /app
EXPOSE 3000
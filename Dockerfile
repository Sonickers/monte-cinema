ARG RUBY_VERSION=3.0.1
FROM docker.io/ruby:$RUBY_VERSION-alpine

ARG BUNDLER_VERSION=2.2.15

# tzdata - timezone data
# postgresql - client for pg_dump
# file - Shrine dependency
# Common dependencies
RUN apk add --update --no-cache \
  bash \
  build-base \
  linux-headers \
  curl \
  file \
  tzdata \
  git \
  vim \
  postgresql \
  postgresql-dev

# Configure bundler
ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

# Uncomment this line if you store Bundler settings in the project's root
# ENV BUNDLE_APP_CONFIG=.bundle

# Upgrade RubyGems and install required Bundler version
RUN gem update --system && \
    gem install bundler:$BUNDLER_VERSION

# Install foreman
RUN gem install foreman

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . ./

# vim:set filetype=dockerfile:

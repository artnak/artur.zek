FROM node:7.10 as build-deps

RUN apt-get update

# basics
RUN apt-get install -y openssl

# Install Ruby.
RUN apt-get install -y ruby ruby-dev

# Install bundler
RUN gem install bundler --no-rdoc --no-ri

# Set working directory
WORKDIR /usr/src/app

# Copy Gemfile
COPY Gemfile ./

# Install ffi
RUN gem install ffi -v '1.9.25' --source 'https://rubygems.org/'

# Bundle deps
RUN bundle

# Copy package & lock file
COPY package.json ./

# Yarn deps
RUN yarn

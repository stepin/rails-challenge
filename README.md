# README

It's Rails version of Flask Python Backend Challenge https://github.com/stepin/python-challenge .
Just to see how it will be different in another language and framework.

## Installation

### Rails installation on macOS

    brew install rbenv
    rbenv init
    #manual steps described in rbenv init
    rbenv install 2.6.1
    rbenv global 2.6.1
    gem install rails
    rbenv rehash

### App start

    bundle
    bundle exec rake db:create db:seed
    bundle exec rails server

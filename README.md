# GwentCards API

Powered by Rails, Grape, Swagger and Mongo.

[![Codeship Status for tbjers/gwentcards-rails](https://codeship.com/projects/ec700160-5aa5-0133-b365-42a590b6b454/status?branch=master)](https://codeship.com/projects/110478)

[![Coverage Status](https://coveralls.io/repos/tbjers/gwentcards-rails/badge.svg?branch=master&service=bitbucket)](https://coveralls.io/bitbucket/tbjers/gwentcards-rails?branch=master)

### Requirements

* Ruby 2.2.2
* MongoDB 3.0.x

### Setup

In order to get up and running:

```sh
$ bundle install
$ bundle exec puma
```

### Testing

Tests are written with RSpec. Most of the tests are request tests directly against the API.

Running tests:

```sh
$ bundle exec rspec spec
```

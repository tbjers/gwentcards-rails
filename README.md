# GwentCards API

Powered by Rails, Grape, Swagger and Mongo.

[ ![Codeship Status for tbjers/gwentcards-rails](https://codeship.com/projects/ae7b5390-5a6b-0133-d121-42a590b6b454/status?branch=master)](https://codeship.com/projects/110406)

[![Coverage Status](https://coveralls.io/repos/tbjers/gwentcards-rails/badge.svg?branch=master&service=bitbucket)](https://coveralls.io/bitbucket/tbjers/gwentcards-rails?branch=master)

### Requirements

* Ruby 2.2.2
* MongoDB 2.6.x

### Setup

In order to get up and running:

```sh
$ bundle install
```

### Testing

Tests are written with RSpec. Most of the tests are request tests directly against the API.

Running tests:

```sh
$ bundle exec rspec spec
```

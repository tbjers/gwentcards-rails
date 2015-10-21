source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.2.3'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt', '~> 3.1.7'
gem 'dotenv-rails', :groups => [:development, :test]
gem 'mongoid', '~> 5.0.0'
gem 'devise'
gem 'grape'
gem 'grape-entity'
gem 'rack-contrib'
gem 'grape-swagger'
gem 'grape-swagger-rails'
gem 'rack-cors', require: 'rack/cors'
gem 'sucker_punch', '~> 1.0'
gem 'rollbar', '~> 2.1.1'
gem 'rails_12factor'

group :development, :test do
  gem 'rspec-rails'
  gem 'mongoid-rspec', '~> 3.0.0'
  gem 'factory_girl_rails'
end

group :development do
  gem 'spring'
  gem 'quiet_assets'
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
end

group :test do
  gem 'faker'
  gem 'coveralls', require: false
  gem 'rubocop', require: false
  gem 'simplecov', require: false
end

gem 'puma'

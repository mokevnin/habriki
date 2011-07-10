source 'http://rubygems.org'

gem 'rails'
gem 'jquery-rails'
gem 'devise'
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'

gem 'sqlite3'
gem 'acts-as-taggable-on'
gem 'omniauth', '>= 0.2.6'
gem 'simple_form'
gem 'ancestry'
gem 'state_machine'
gem 'hoptoad_notifier'
gem 'haml'
gem 'sass'
gem 'will_paginate', '>= 3.0.pre2'
gem 'thinking-sphinx'
gem "oa-oauth"
gem "oa-openid"
gem 'configatron'

# Use unicorn as the web server
# gem 'unicorn'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:

group :development, :test do
  gem 'factory_girl_rails'
end

group :development do
  # Deploy with Capistrano
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'capistrano_colors'
  gem 'yard'
end

group :test do
  gem 'webmock'
  gem 'spork'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rcov'
end

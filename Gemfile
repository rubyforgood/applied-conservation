# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.0'
gem 'react-rails'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem "chromedriver-helper"
end

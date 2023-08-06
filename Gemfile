# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').split.first

########
# Core #
########

gem 'rails', github: 'rails/rails', branch: 'main'

# Web server
gem 'puma', '~> 5.0'

# Cache ruby calls to shrink boott time; required in config/boot.rb
gem 'bootsnap', require: false

######
# DB #
######

# Database for Active Record
gem 'sqlite3', '~> 1.4'

# Generate mermaid
gem 'rails-mermaid_erd'

# Caching
gem 'redis'

###############
# Controllers #
###############

# Fast JSON serializer
gem 'oj'

# Throttle accesses and prevent from attacking with DDoS
gem 'rack-attack'

# Generate Hashed ID
gem 'hashids'

#########
# Views #
#########

# Asset Pipeline
gem 'sprockets-rails'

# Bundle JavaScript
gem 'jsbundling-rails'

# Bundle CSS
gem 'cssbundling-rails'

# Hotwire's SPA-like page accelerator
gem 'turbo-rails'

# Hotwire's modest JavaScript framework
gem 'stimulus-rails'

# Provide healthcheck
gem 'rails-healthcheck'

#########
# Other #
#########

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # Rubocop
  gem 'rubocop', require: false
  gem 'rubocop-capybara', require: false
  gem 'rubocop-erb', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

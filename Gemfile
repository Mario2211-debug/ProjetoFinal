source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

group :production do
  gem 'rails_12factor', '0.0.2'
  gem 'puma', '~> 3.11'
end

gem 'acts-as-taggable-on', '~> 7.0'
gem 'simple_form'
gem 'groupdate'
gem 'rails', '~> 6.0'
gem 'sqlite3'
gem 'rack-cors'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'rails_admin'
gem 'cancancan'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder'
gem 'redis', '~> 4.0'
gem 'faraday'
gem 'activerecord-reputation-system'
gem 'rails-assets-sweetalert2', source: 'https://rails-assets.org'
gem 'bcrypt', '~> 3.1.7'
gem 'carrierwave', '0.10.0'
gem 'mini_magick', '3.8.0'
gem 'fog', '1.36.0'
gem 'will_paginate', '4.0'
gem 'bootstrap-will_paginate', '0.0.10'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'bootstrap', ' 4.5.0'
gem "font-awesome-rails"
gem 'sassc-rails', '>= 2.1.0'
gem 'jquery-rails'
gem 'sdoc', '0.4.0', group: :doc
gem "chartkick"
gem 'second_level_cache', '~> 2.6.3'
gem 'pry'
gem 'hotwire-rails'
gem 'turbo-rails'
gem 'twitter-bootstrap-rails'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rubocop'
gem 'ruby-lsp'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "chartkick"
  gem 'pry'
  gem 'activerecord-reputation-system'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'spring', '1.1.3'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace', '0.1.3'
  gem 'guard-minitest', '2.3.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "notifications", "~> 1.1"
#gem 'therubyracer'
#gem "sprockets", "3.7.2"
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  #gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  gem "chartkick"
  gem 'pry'
  gem 'activerecord-reputation-system'
  #gem 'therubyracer'
  #gem 'execjs'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'spring', '1.1.3'
end



group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "notifications", "~> 1.1"

gem "tailwindcss-rails", "~> 2.0"

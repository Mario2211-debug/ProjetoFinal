source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'


group :production do
  gem 'pg',             '0.17.1'
  gem 'rails_12factor', '0.0.2'
  #gem 'puma', '~> 3.7'
  gem 'puma', '~> 3.11'

  #gem 'puma',           '2.11.1'
end
gem 'acts-as-taggable-on', '~> 7.0'
#gem 'searchkick'
gem 'simple_form'
gem 'groupdate'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'rack-cors'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
gem 'rails_admin'  #, '~> 2.0.2'
#gem 'devise'    #, '~> 4.7.2'
gem 'cancancan' #, '~> 1.15.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
 gem 'redis', '~> 4.0'
 #gem 'therubyracer'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'faraday'
gem 'activerecord-reputation-system'
gem 'rails-assets-sweetalert2', source: 'https://rails-assets.org'
gem 'bcrypt', '~> 3.1.7'
#gem 'faker',                '~>1.6.6'
gem 'carrierwave',             '0.10.0'
gem 'mini_magick',             '3.8.0'
gem 'fog',                     '1.36.0'
gem 'will_paginate',         '3.1.7'
gem 'bootstrap-will_paginate', '0.0.10'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'bootstrap', ' 4.5.0'
gem "font-awesome-rails"
gem 'sassc-rails', '>= 2.1.0'
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails'
gem 'sdoc',     '0.4.0', group: :doc
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
gem "chartkick"
gem 'second_level_cache', '~> 2.6.3'
gem 'pry'
gem 'hotwire-rails'
#gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'turbo-rails'
#gem 'execjs'
#gem 'therubyracer'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
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

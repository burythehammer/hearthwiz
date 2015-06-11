source 'https://rubygems.org'
ruby '2.2.0'


gem 'rails', '4.2.0' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'sass-rails', '~> 5.0' # Use SASS for stylesheets
gem 'haml'  # haml for HTML docs
gem 'haml-rails'
gem 'uglifier', '>= 1.3.0'  # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.1.0' # Use CoffeeScript for .coffee assets and views
gem 'puma' # server
gem 'pg' # postgres database
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'turbolinks' # Turbolinks makes following links in your web application faster.
gem 'jbuilder', '~> 2.0'  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'sdoc', '~> 0.4.0', group: :doc # bundle exec rake doc:rails generates the API under doc/api.
gem 'json'
gem 'colorize'# prettifies seeding

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'normalize-rails'

group :production do
  gem 'rails_12factor' # Used for heroku
end

group :development do
  gem 'cuke_sniffer', require: false # cucumber linting
  gem 'rubocop', require: false # ruby linting
  gem 'haml-lint', require: false # haml linting
  gem 'flog', require: false # ABC analysis
  gem 'flay', require: false # finds duplicate code
  gem 'flay-actionpack', require: false # stops errors with flay
end

group :development, :test do
  # gem 'debugger'  # Call 'debugger' anywhere in the code to stop execution and get a debugger consol
  gem 'database_cleaner' # wipes database clean between test rounds
  gem 'web-console', '~> 2.0'  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'spring'  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'rspec-rails'
  gem 'factory_girl_rails', require: false # generates fixtures for tests
  gem 'shoulda-matchers' # test syntax
end

group :test do
  gem 'capybara', require: false
  gem 'faker' # generates fake data for factorygirl
  gem 'poltergeist'  # Capybara driver for phantom.js
  gem 'cucumber-rails', require: false # cucumber
  gem 'selenium-webdriver', require: false # selenium 
  gem 'rspec-expectations' # test syntax
  gem 'guard-rspec' # 
  gem 'launchy'
end

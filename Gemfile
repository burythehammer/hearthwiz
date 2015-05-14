source 'https://rubygems.org'
ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# haml for HTML docs
gem 'haml'
gem "haml-rails"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# server
gem 'puma' 

# postgres database
gem 'pg'



gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'turbolinks' # Turbolinks makes following links in your web application faster.
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'json'
gem 'factory_girl_rails'

# prettifies seeding
gem 'colorize'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'devise' # users

# Used for heroku
gem 'rails_12factor', group: :production

gem 'normalize-rails'

# Use Capistrano for deployment
#gem 'capistrano-rails', group: :development


group :development do
  gem 'cuke_sniffer', require: false
  gem 'rubocop', require: false
  gem 'haml-lint', require: false
  gem 'flog', require: false
  gem 'flay', require: false
  gem 'flay-actionpack', require: false
end

group :development, :test do
  # Call 'debugger' anywhere in the code to stop execution and get a debugger console
  #  gem 'debugger'
  gem 'database_cleaner'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'rspec-rails'
end

group :test do

  gem 'capybara', require: false
  gem 'poltergeist'  # Capybara driver for phantom.js
  gem 'shoulda-matchers'
  gem 'cucumber-rails', require: false
  gem 'selenium-webdriver', require: false
  gem 'rspec-expectations'

end


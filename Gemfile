source 'https://rubygems.org'
ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
# PostgreSQL For heroku
gem 'pg'
gem 'rails_12factor'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Rails console
gem 'rb-readline'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# HTTP client support
gem 'httparty'
# Most popular HTML, CSS, and JavaScript framework
gem 'bootstrap-sass'
# Javascript/CSS rendering optimizations
gem 'jquery-turbolinks'
# For OAuth2 logins
gem 'omniauth-github'

# Use Unicorn as the app server
# gem 'unicorn'
# Should consider using Puma
# Procfile: web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
# gem 'puma'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Unit testing
  gem 'rspec-rails', '~> 3.0'
  gem 'rspec-its'
  # Prefer sqlite3 for local development
  gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'better_errors'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'rack-mini-profiler'
  gem 'rails_layout'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  # Unit testing line coverage
  gem 'simplecov', require: false
  # Measuring Test Coverage with Code Climate
  gem "codeclimate-test-reporter", require: false
  # For httparty stubs
  gem 'webmock'
  # capybara JS support
  gem 'selenium-webdriver'
  # for cleaning up after selenium
  gem 'database_cleaner'
  # better replacement for selenium
  gem 'poltergeist'
end


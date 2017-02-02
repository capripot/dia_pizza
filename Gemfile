source 'https://rubygems.org'

ruby "2.3.3"


# fixes bundler version
gem "bundler"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.7'

# web server
gem "puma", "2.14.0"

# Middleware cross origin
# gem "rack-cors", require: "rack/cors"

# settings manager
gem "figleaf", "~> 0.2.0"

# authorization system
# gem "cancan", "~> 1.6.10"

# release features progressively
# gem 'rollout', "= 2.3.0"


## For Models

# add URL validator
gem "validate_url", "~> 1.0.2"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'


## DB

# Relational DB
gem 'pg'

# NoSQL db
# gem "redis", "~> 3.2.1"
# gem "redis-namespace", "~> 1.5.2"

# Queuing system, wrapper for RabbitMQ
# gem "hutch", "~> 0.22.1"


## CSS stuff

# Use SASS for stylesheets
gem 'sass-rails', '~> 5.0'

## JS stuff

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
gem "browserify-rails"
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0' # you probably should also use oj, oj_mimic_json, multi_json


## API helpers

# gem "grape", "~> 0.17.0"
# gem "grape-entity", "~> 0.5.1"


## HTML/Form helpers

# gem "simple_form", "~> 3.3.1"
# gem 'simple_form_object', "~> 0.0.8"
# forms for nested associations
# gem "cocoon", "~> 1.2.9"

# markdown processor
# gem "redcarpet", '~> 3.3'
# gem "reverse_markdown", "~> 1.0.3"
# gem "markdown_videos", "~> 1.0"

# make any model taggable
# gem "acts-as-taggable-on", "~> 3.4"

# better URI parser
gem "addressable", "~> 2.4"

# never delete anything
# gem "paranoia", "~> 2.0"

# to get slug for a model
# gem "friendly_id", "~> 5.1.0"

# pagination
# gem "kaminari", "~> 0.17.0"

## Third party services

# get reviews
gem 'yelp', require: 'yelp'

# get HTML page as object
gem 'nokogiri'

# report bugs
# gem "honeybadger", "~> 2.0"

# logs in one place
# gem "le"

# performance reports
# gem 'newrelic_rpm', '~> 3.15', '>= 3.15.0.314'

# sending emails
# gem "customerio"

# cdn and process images
# gem "carrierwave"
# gem "cloudinary", "~> 1.1.4"

# shortener
# gem "bitly", "~> 0.10.4"


## Environement specific

group :production do
  # Heroku specific: Exit logging on STDOUT to be able to get in `heroku logs`
  gem 'rails_12factor'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # start with Procfile
  gem "foreman"

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # shut up assets
  gem "quiet_assets"

  # test engine
  gem "rspec-rails", "~> 3.0"

  # format this rspec output for CircleCI
  gem "rspec_junit_formatter", "~> 0.2.3"

  # cop the format of .rb files
  gem "rubocop", "~> 0.37.2", require: false

  # try to detect security vulnerabilities
  gem "brakeman", "~> 3.3.0", require: false

  # kill theses nasty N+1 queries
  gem "bullet", "~> 5.1.0"

  # fake data for tests
  gem "faker", "~> 1.6"

  # factory girl
  gem "factory_girl_rails", "~> 4.0"
end

group :test do
  # user simulation
  gem "capybara", "~> 2.7"

  # JS engine (v8 from Google)
  gem "poltergeist", "~> 1.9"

  # one liners for Rails functionality tests
  gem "shoulda-matchers", "~> 3.1"

  # remove data after test
  gem "database_cleaner", "~> 1.5"

  # capybara save_and_open_page uses launchy to open page automatically
  gem "launchy", "~> 2.4.3"

  # test rake tasks
  gem "fantaskspec", "~> 1.0.0"

  # test warden authtification gem (in Satellite)
  gem "warden-rspec-rails"

  # test queuing
  gem 'test_hutch', git: "git@github.com:challengepost/test_hutch.git"

  # travel in time within your tests
  gem "timecop"

  # avoid external requests by recording them
  gem "vcr", "~> 3.0.3"

  # fake web requests DEPRECATED!
  gem "fakeweb", "~> 1.3.0"
end

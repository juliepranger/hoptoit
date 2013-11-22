source 'https://rubygems.org'

#add paperclip
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"


#add dotenv so that secrets do not get exposed on Github
gem 'dotenv-rails', :groups => [:development, :test]

ruby "2.0.0"


#use Passenger as the production server ('cause it's awesome) (EP)
gem 'passenger'

#I prefer to program in HAML... it saves SO much time (EP)
gem 'haml'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', github: 'codahale/bcrypt-ruby'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
	gem 'rspec-rails'
	gem 'factory_girl_rails'
  gem 'letter_opener'
end

group :test do
	gem 'capybara'
	gem 'guard-rspec'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'capybara'
  gem 'guard-rspec'
end

group :production do
  gem 'rails_12factor'
  gem 'thin'
end

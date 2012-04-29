source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'jquery-rails'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'settingslogic'
gem 'eventmachine', :git => 'git://github.com/eventmachine/eventmachine.git'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'tapp'
  gem 'sqlite3'
  if RUBY_PLATFORM.downcase.include?('darwin')
    gem 'guard'
    gem 'guard-rspec'
    gem 'rb-fsevent'
    gem 'growl'
  end
end

group :produciton do
  gem 'pg'
  gem 'thin'
end

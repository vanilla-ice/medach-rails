source 'https://rubygems.org'
ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
gem 'activeadmin', '~> 1.3.0'
gem "active_material", github: "vigetlabs/active_material"

# Use sqlite3 as the database for Active Record
gem 'pg', '~> 0.18.4'
# Use Puma as the app server
gem 'puma', '~> 3.7'
gem 'fog', '1.42.0'
gem 'mina', '1.2.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'carrierwave', '~> 1.3'
gem 'mini_magick'
gem 'devise'
gem 'devise-i18n'
gem 'acts-as-taggable-on', '5.0.0'
gem 'pry-rails'
gem 'pg_search', '2.1.1'
gem 'figaro', '1.1.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
gem 'jquery-ui-rails'
gem 'select2-rails'
gem 'activeadmin-select2', github: 'mfairburn/activeadmin-select2'

gem 'active_model_serializers', '~> 0.10.2'
gem 'kaminari', '1.1.1'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# gem "browserify-rails"

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'sidekiq'
gem 'sidekiq-cron'

# RBAC
gem 'cancancan', '~> 2.0'

# Documentation
gem 'swagger-docs'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'haml'
gem 'chosen-rails'
gem 'impressionist'
gem 'activeadmin_addons'
gem 'rails-i18n'

gem "rack-cors", "~> 1.0"

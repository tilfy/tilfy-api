source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'bootsnap', '>= 1.1.0', require: false


# for using application.yml
gem 'figaro'

# for user authentication
gem 'devise'
gem 'devise_token_auth'
gem 'omniauth-google-oauth2'
gem 'rest-client'

# trailblazer
gem 'trailblazer', '2.1.0.rc1'
gem 'trailblazer-rails', '2.1.5'
gem 'trailblazer-operation', '0.4.1'
gem 'reform', '2.3.0.rc1'
gem 'reform-rails', '0.2.0.rc2'
gem 'dry-validation', '0.12.2'

# for documentation
gem 'rswag'
gem 'rspec-rails'

gem 'rack-cors', require: 'rack/cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot'
  gem 'shoulda'
  gem 'pry-rails'
  gem 'awesome_print'
  gem 'faker'
end

group :development do
  gem 'guard-rspec', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

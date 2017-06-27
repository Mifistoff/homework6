git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# ===== system =====
gem 'rails', '~> 5.1.1'
gem 'pg'
gem 'puma', '~> 3.7'

# ===== front-end =====
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'slim', '~> 3.0', '>= 3.0.6'
gem 'slim-rails', '~> 3.0', '>= 3.0.1'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'bootstrap'

# ===== auth =====
gem 'devise'

group :development, :test do
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.5'
  gem 'pry-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rails-controller-testing',
    git: 'https://github.com/rails/rails-controller-testing'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

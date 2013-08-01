source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'simple_form', '>= 3.0.0.rc'
gem 'bcrypt-ruby', '~> 3.0.0', :require => 'bcrypt' 
gem 'redcarpet'
gem 'thin'
gem "nested_form", :git => 'git://github.com/ryanb/nested_form.git'
gem 'omniauth-identity'
gem 'omniauth-facebook'
gem "omniauth-google-oauth2"
gem 'figaro'

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :rbx]
  gem 'quiet_assets'
end

group :production do
  gem 'pg' # dont want sqlite in production
  gem 'rails_12factor'
end

source 'http://rubygems.org'

gem 'rails', '3.1.1'

gem 'devise', '~> 1.4.0', :git => 'git://github.com/plataformatec/devise.git', :branch => 'v1.4'
gem "devise_ldap_authenticatable", :git => "git://github.com/jksilliman/devise_ldap_authenticatable.git"

gem 'sqlite3'
gem 'haml'
gem 'haml-rails'
gem 'simple_form', :git => 'git://github.com/plataformatec/simple_form.git', :branch => 'wrappers'
# gem 'therubyracer', :require => 'v8'
gem 'jquery-rails'

gem 'capistrano'

group :production do
  gem 'therubyracer'
end

group :development do
  gem 'annotate'  
end

group :test do
  gem 'turn', :require => false
end

group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

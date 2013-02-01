source "https://rubygems.org"
ruby "1.9.3"


gem "rails", :github => "territorio/rails", :branch => "th"
gem "active_model_serializers", :github => "territorio/active_model_serializers", :branch => "th"

gem 'devise', '~> 2.1'
gem "rails_admin", :github => "territorio/rails_admin", :branch => "th"


gem 'thin'

group :development, :test do
  gem 'sqlite3', '~> 1.3'
end

group :production do
  gem 'pg', '~> 0.13'
end


gem 'jquery-rails'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end


source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#ODM, this is essential for libraries like devise
gem 'mongoid', '~> 5'
gem 'bson_ext'
#for download pdf and convert
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
#authentication gem
gem 'devise','~> 3.5'

#authorization gem
gem 'cancancan', '~> 1.10'
#for roles
gem 'rolify'

#pagination gem
gem 'kaminari'

group :assets do
  gem 'chosen-rails'
end

#taggable
gem 'mongoid-tags-arent-hard'

#commentable		
gem 'mongoid_commentable' ,:git => 'https://github.com/molhaMaleh/mongoid_commentable.git'

#for uploading files		
gem 'carrierwave','~> 0.10'		
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'		


# WYSIWYG text editor
gem 'ckeditor'
#math formula
gem 'wirispluginengine'

gem 'rails_email_validator','~> 0.1'
gem 'devise_security_extension','~> 0.9'

#admin panel gem
gem 'rails_admin'

#pretty url for SEO
gem 'mongoid-slug'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

#for facebook
#gem 'omniauth-facebook'
gem 'omniauth-gplus','~> 2.0'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

 gem 'pusher'

group :test do
  gem 'minitest-around'
  gem 'database_cleaner'
end
 
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


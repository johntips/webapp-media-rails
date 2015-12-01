#local setting
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
#production rails c setting
# ENV['BUNDLE_GEMFILE'] ||= '/var/www/html/webapp-tabimuse-rails/current/Gemfile'

require 'bundler/setup' # Set up gems listed in the Gemfile.

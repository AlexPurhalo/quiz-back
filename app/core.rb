require 'rubygems'
require 'bundler'
Bundler.require

app_base = "#{File.dirname(File.expand_path(__FILE__))}/.."
Dir.glob("#{app_base}/app/api/*rb").each { |i| require i }

class App < Grape::API
  format :json
  mount Questions
  mount Categories
end
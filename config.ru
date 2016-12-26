require 'rack'
require 'rubygems'
require 'bundler/setup'
require 'grape'
require 'sequel'
require 'active_model'

DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://db/database.db')

require './app/core'

run App
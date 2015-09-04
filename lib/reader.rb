#encoding: UTF-8
require 'simple-rss'
require 'open-uri'
require 'mysql2'

Dir["./lib/*.rb"].each { |rb| require rb }
Dir["./lib/**/*.rb"].each { |rb| require rb }
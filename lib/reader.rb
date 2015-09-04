#encoding: UTF-8
require 'simple-rss'
require 'open-uri'
require 'mysql2'
require 'mysql2-cs-bind'

Dir["./lib/*.rb"].each { |rb| require rb }
Dir["./lib/**/*.rb"].each { |rb| require rb }
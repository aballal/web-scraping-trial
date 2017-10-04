require 'httparty'
require 'nokogiri'

require_relative 'scraper'
require_relative 'output'

scraper = Scraper.new
output = Output.new(scraper.items)
output.csv("output.csv")

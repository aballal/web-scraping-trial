require 'httparty'
require 'nokogiri'

require_relative 'scraper'
require_relative 'output'

scraper = Scraper.new
output = Output.new(scraper.names.zip(scraper.prices))
output.csv("../output.csv")

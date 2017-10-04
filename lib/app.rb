require 'httparty'
require 'nokogiri'
require 'json'

require_relative 'scraper'
require_relative 'output'

scraper = Scraper.new
output = Output.new(scraper.items)
output.csv("output.csv")
output.json("output.json")

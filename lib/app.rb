require_relative 'getter'
require_relative 'scraper'
require_relative 'outputter'

getter = Getter.new
page = getter.page("https://store.nike.com/us/en_us/pw/mens-nikeid-lifestyle-shoes/1k9Z7puZoneZoi3")

scraper = Scraper.new(page)
items = scraper.items

output = Outputter.new(items)
output.csv("output.csv")
output.json("output.json")

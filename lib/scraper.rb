class Scraper
  attr_reader :parse_page

  def initialize
    page = HTTParty.get("https://store.nike.com/us/en_us/pw/mens-nikeid-lifestyle-shoes/1k9Z7puZoneZoi3")
    @parse_page = Nokogiri::HTML(page)
  end

  def names
    parse_page.css(".grid-item-info").css(".product-name").css(".product-display-name").children.map do |name|
      name.text
    end
  end

  def prices
    parse_page.css(".grid-item-info").css(".product-price").css("span.local").children.map do |price|
      price.text
    end
  end
end

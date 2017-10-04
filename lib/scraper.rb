class Scraper
  attr_reader :parse_page

  def initialize
    page = HTTParty.get("https://store.nike.com/us/en_us/pw/mens-nikeid-lifestyle-shoes/1k9Z7puZoneZoi3")
    @parse_page = Nokogiri::HTML(page)
  end

  def items
    parse_page.css(".grid-item-info").map do |item|
      [name(item), price(item)]
    end.reject { |info| info == ["", ""]}
  end

  private

  def name(item)
    item.children.css(".product-name").css(".product-display-name").text
  end

  def price(item)
    item.css(".product-price").css("span.local").text
  end
end

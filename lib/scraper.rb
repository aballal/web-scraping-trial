class Scraper
  def initialize(page)
    @parse_page = page.parser
  end

  def items
    parse_page.css(".grid-item-info").map do |item|
      [name(item), price(item)]
    end.reject { |info| info == ["", ""]}
  end

  private

  attr_reader :parse_page

  def name(item)
    item.children.css(".product-name").css(".product-display-name").text
  end

  def price(item)
    item.css(".product-price").css("span.local").text
  end
end

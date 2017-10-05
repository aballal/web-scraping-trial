require 'csv'
require 'json'

class Outputter
  def initialize(details)
    @details = details
  end

  def display
    details.map do |name, price|
      "#{name}, #{price}"
    end.join("\n")
  end

  def csv(filename)
    CSV.open(fullpath(filename),"w") do |csv|
      details.each { |detail| csv << detail}
    end
  end

  def json(filename)
    File.open(fullpath(filename),"w") do |file|
      file.puts JSON.pretty_generate(details.map {|name, price| {name: name, price: price}})
    end
  end

  private

  attr_reader :details

  def fullpath(filename)
    File.join(File.dirname(__FILE__), '..', filename)
  end
end

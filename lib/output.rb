class Output
  def initialize(details)
    @details = details
  end

  def display
    details.map do |name, price|
      "#{name}, #{price}"
    end.join("\n")
  end

  def csv(filename)
    filename = File.join(File.dirname(__FILE__), '..', filename)
    CSV.open(filename,"w") do |csv|
      details.each { |detail| csv << detail}
    end
  end

  private

  attr_reader :details
end

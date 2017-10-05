require 'mechanize'

class Getter
  def initialize(agent = Mechanize.new)
    @agent = agent
  end

  def page(url)
    agent.get(url)
  end

  private

  attr_reader :agent
end

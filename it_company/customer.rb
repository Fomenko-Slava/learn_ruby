require_relative 'people'

class Customer < People

  def initialize (options={})
    super
  end

  attr_reader :requirements, :remuneration, :сompetence, :adequacy, :manager

end
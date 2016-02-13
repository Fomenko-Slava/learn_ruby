require_relative 'base'

class Order < Base

  def initialize (options={})
    super
  end

  attr_reader :сomplexity, :clear, :deadline, :customer, :manager

end
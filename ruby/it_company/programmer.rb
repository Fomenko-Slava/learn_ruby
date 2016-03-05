require_relative 'people'

class Programmer < People

  def initialize (options={})
    super
  end

  attr_reader :skill, :rationality, :fatigue, :manager, :order

end
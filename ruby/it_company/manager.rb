require_relative 'people'

class Manager < People

  def initialize (options={})
    super
  end

  attr_reader :communicability, :ability_to_organize

end
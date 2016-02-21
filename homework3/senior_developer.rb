require_relative 'developer'

class SeniorDeveloper < Developer

  MAX_TASKS = 15

  def work!
    if [true, false].sample
      super
      super
    else
      puts 'Что-то лень'
    end
  end

end
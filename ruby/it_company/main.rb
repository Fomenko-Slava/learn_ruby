require 'date'
require_relative 'customer'
require_relative 'manager'
require_relative 'programmer'
require_relative 'order'

class ItCompanySimulator

  def self.start

    manager = Manager.new({ communicability: 10, ability_to_organize: 2 })
    сustomer = Customer.new({ requirements: 10, remuneration: 2, сompetence:5, adequacy:10, manager:manager })
    order = Order.new({ сomplexity: 10, clear: 0, deadline: Date.new(2015,02,21), сustomer: сustomer, manager: manager })
    programmer = Programmer.new({ skill: 10, rationality: 5, fatigue: 3, manager:manager, order:order })

    #p manager.communicability
    # p сustomer
    #p order
    # p programmer
  end

end

ItCompanySimulator.start()
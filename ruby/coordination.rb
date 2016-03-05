class Coordination

  @@radiuses = [{msg:'Центр!', val:100}, {msg:'Близко!', val:200}, {msg:'Далеко!', val:300}]
  @@screen_size = [1000, 1000]
  @@miss_messages = ['Мимо области приложения!', 'Мимо!']

  def initialize (options={})
    options.each do |key, value|
      instance_variable_set("@#{key}", value.to_i) unless value.nil?
    end
  end

  attr_accessor :x, :y

  def check
    center = set_center

    if (@x <= @@screen_size[0] && @y <= @@screen_size[1])
      @@radiuses.each do |value|
        if (((@x-center[0])**2 + (@y-center[1])**2) <= value[:val]**2)
          puts value[:msg]
          return
        end
      end
      puts @@miss_messages[1]
    else
      puts @@miss_messages[0];
    end
  end

  private
    def set_center
      [@@screen_size[0]/2, @@screen_size[1]/2]
    end
end

coord = Coordination.new({x:ARGV[0], y:ARGV[1]})
coord.check
puts coord.x
puts coord.radiuses
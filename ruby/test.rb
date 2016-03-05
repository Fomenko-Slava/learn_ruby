#require 'pry'
#puts '1'.integer?

#puts "интерполяция %s %s" % [1, 2]

#puts 'интерполяция %{b} %{a}' % {a:1, b:2}

# поиск в сторке
# puts 'Строка такая вот'.match('та')
# puts 'Строка такая вот'.scan('та')
# puts 'Строка такая вот'.include?('та')
#Замена
# puts 'Строка такая вот'.sub('та', 'aa')
# puts 'Строка такая вот'.gsub('а', 'Б')

#
# puts 'строка такая вот'.capitalize()
# puts 'Строка такая вот'.reverse()

#puts 'ddd'.methods

#p $LOAD_PATH

#puts self.methods

#binding.pry

arr = Array.new(3) {|i| (i+1) }

arr1 = arr.clone
arr1 << 9
p arr
p arr1

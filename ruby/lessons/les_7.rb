require 'pp'
# пред иф
# x = 1
# res = "аа" if x == 1
#
# x = 1

# case x
#   when 1
#     puts 'Один' # выходит при первом совпадении условия
#   when Fixnum
#     puts 'Fixnum'
#   when 1
#     puts 'Ещё раз один'
# end

# a = [1, 2, 3]
# a.shift # удалить первый элемент из массива
#
# p a
#
# # блоки
# z = lambda {|i| puts i}
# z.call(133)

# исключения

animal = %w[bunny tiger python]
names = %w[vasya ivan slava]
sex = %w[F M]

animals = 10.times.map{{kind:animal.sample, name: names.sample, sex:sex.sample}}

pp animals

#p animals.select{|a| a[:kind] == 'bunny'}
#p animals

#p animals.reject{|a| a[:kind] == 'tiger'}
#p animals

#p animals.group_by{|a| a[:sex]}
#p animals.group_by{|a| a[:sex]}.map{|sex, group| [sex, group.count]}.to_h


#p animals.select{|a| a[:name].downcase.include?('i')}

pp animals.each_with_index.select{|a, i| (i+1).even?}.map{|a, i| a[:name]}


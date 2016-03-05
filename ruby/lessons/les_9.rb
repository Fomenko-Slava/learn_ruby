#урок 8


# превращать массивы в отдельные штуки можно во многих контекста, напр:
# tasks = ['Почесать кота', 'Покормить попугая', 'Похоронить рыбку']
#
# first, *rest = tasks
# p first
# p rest

# метод с любым количеством аргументов:
# def add_tasks(*tasks)
#   p tasks
# end
#
# add_tasks 'Почесать кота', 'Покормить попугая', 'Похоронить рыбку'

# если последний аргумент — хеш, то скобки хеша при вызове можно опустить:
=begin
def add_task(task, options)
  p task
  p options
end

add_task 'Почесать кота', priority: :high, description: 'Нежно!', author: 'Вася'
#                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#                                    вот это всё — последний аргумент

# этот код совершенно аналогичен, но «визуального мусора» больше:
add_task( 'Почесать кота', {priority: :high, description: 'Нежно!', author: 'Вася'})
=end


# В современном руби есть специальное понятие именованных аргументов:
=begin
def add_task(task,   priority: :norm     , **options)
#           ^^^^     ^^^^^^^   ^^^^^^        ^^^^^
#           обычный  именован  его значение  остальные именованные
#                              по умолч
  p task
  p priority
  p options
end

add_task 'Почесать кота', priority: :high, description: 'Нежно!', author: 'Вася'
=end

#b = proc{puts 'foo'}
# это блок! кусок кода, который можно сохранить в переменной, а потом вызвать
#b.call

# b = proc{
#   puts 'foo'
#   puts 'bar'
#   puts 'haha'
#   x = 100
#   if x < 200
#     puts 'lower'
#   end
# }
# b.call

# task_adder = proc do |*tasks, priority: :normal, **options|
#   p tasks, priority, options
# end
#
# #task_adder.call('Почесать кота', 'постирать', priority: :high, description: 'Нежно!', author: 'Вася')
#
# # ещё к слову, блок можно вызывать вот так:
# task_adder['Почесать кота', priority: :high, description: 'Нежно!', author: 'Вася']
# # и даже вот эдак:
# task_adder.('Почесать кота', priority: :high, description: 'Нежно!', author: 'Вася')
# #         ^ да, именно точка-скобка

# блоки можно передавать в методы:
=begin
def animal_says(type, &what)
  puts type          #^ знак, что тут ожидается блок
  what.call
  # или через yield вызвать переданный блок
  yield
end

# вызывается так:
animal_says('tiger'){puts 'rrr'}
=end
=begin

a = [1, 2, 3]
# возьмём теперь простой пример:
p a.map {|i| i.to_s}
#         ^  ^ — два раза написать i ради такого простого вызова?.. некрасиво!

# так лучше:
p a.map(&:to_s)
      # ^ ^^^^^
      # | обычный символ :to_s
      # оператор «преврати меня в блок»

p :to_s.to_proc.call(1) # :)

символ :to_s - является объектом класса Symbol и вызывает в этом классе метод to_proc
=end

# Метод to_proc можно определить у любого класса!
# class Screamer
#   def to_proc
#     proc{|s| s.upcase}
#   end
# end
#
# scr = Screamer.new
#
# p ['test', 'me'].map(&scr) # проверьте как это работает!

# класс Библиотека
class Library
  attr_reader :books

  def initialize
    # в ней лежат какие-то книжки...
    @books = 5.times.map{|i|
      {title: "Book #{i}", pages: rand(1000)}
    }
    @filters = {}
  end

  # принимает блок и фильтрует книжки этим блоком
  def get(&filter)
    @books.select(&filter)
  end

  # принимает блок и имя фильтра и запоминает его
  def add_filter(name, &block)
    @filters[name] = block
  end

  # принимает имя фильтра и аргументы фильтра
  def filter(name, *arg)
    fltr = @filters[name] # находит фильтр по имени
    @books.select{|b| fltr.call(b, *arg)} # фильтрует книжки найденным фильтром, передавая ему аргументы
  end

end

#l = Library.new
#p l.books # все книги

# проверяем get
#p l.get{|book| book[:pages] < 400}
#      ^^^^^^^^^^^^^^^^^^^^^^^^^^^
#      вот это попадёт в get как блок по имени filter

# проверяем add_filter/filter
# l.add_filter :title do |b, str|
#   b[:title].include?(str)
# end

# в Библиотеке будет фильтр по имени title, у которого вот такой фильтрующий блок!

# вызовет фильтрующий блок
#p l.filter :title, '3'
#          ^^^^^^   ^
#       имя фильтра |
#                   |
#           попадёт в метод filter как arg,
#           будет передано в фильтрующий блок
#           попадёт в него как аргумент str

# Демонстрация замыкания
def test_sum(&block)
  # p y — это бросило бы ошибку, переменная y тут неизвестна
  puts block.call(5) # но блок прекрасно с ней просуммирует
end

y = 10
test_sum{|i| i + y} # потому что вот здесь он запомнил контекст, где был определён
# как бы «замкнул» его в себе, включая переменную y
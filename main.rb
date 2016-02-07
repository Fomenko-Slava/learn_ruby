if ARGV.length == 4
  point_1, point_2 = [ARGV[0], ARGV[1]], [ARGV[2], ARGV[3]]

  if point_1 == point_2
    puts 'Точка найдена!'
  elsif point_1[0] == point_2[0]
    puts 'х координата верна, y нет'
  elsif point_1[1] == point_2[1]
    puts 'y координата верна, x нет'
  else
    puts 'Близко, но нет'
  end

else
  puts 'Нужно передать ровно 4 аргумента!'
end
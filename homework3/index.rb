require_relative "developer"
require_relative "junior_developer"
require_relative "senior_developer"

dev = Developer.new('Вася')
junior = JuniorDeveloper.new('Джун')
senior = SeniorDeveloper.new('Сениор')

senior.add_task('Сделать всё')
senior.add_task('Залить всё')

senior.work!
senior.work!

# junior.add_task('Протереть экран ')
# junior.add_task('Почистить мышь')
# junior.add_task('Учиться')

#dev.add_task('Полить кактус')
#dev.add_task('Помыть машину')

#junior.add_task('Учиться')


#puts dev.status
#p dev.can_add_task?

# begin
#   dev.work!
# rescue Developer::EmptyTasks
#   puts 'нет задач же'
# end

#p dev.can_work?

# dev.add_task('Полить кактус')
# dev.add_task('Помыть машину')
# dev.add_task('Постирать')

#puts dev.tasks

#puts dev.status
#p dev.can_add_task?
#p dev.can_work?

#dev.work!
#dev.work!
#dev.work!

#p dev.can_work?

#puts dev.status
#p dev.can_add_task?



#puts dev.tasks

#dev.work!
#dev.work!
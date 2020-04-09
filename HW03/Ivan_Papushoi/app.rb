# The core idea of the app:
# there are objects "tasks" that assign to students and they should solve it
# mentor see results, check it, and set statuses 'success' and 'denied'
# if it was denied, students try to resolve it and sends results again.
# Mentors and students can requests tasks selections
# which were created, passed, solved and denied

require_relative 'student'
require_relative 'mentor'
require_relative 'task'

students = []
student1 = Student.new('Igor')
student2 = Student.new('Sergey')
students << student1
students << student2
mentor = Mentor.new('Timur', students)

puts mentor.create_task(1)
mentor.notify_students(1)
puts mentor.create_task(2)
mentor.notify_students(2)

puts '--------------------'

puts student1.submit_homework(1)
puts student1.submit_homework(2)
puts student2.submit_homework(1)

mentor.check_students_submitted
puts mentor.set_status_success(student1, 1)
puts mentor.set_status_success(student2, 1)
puts mentor.set_status_fail(student1, 2)

puts '--------------------'

puts student1.check_denied
puts student1.resolve_homework(2)
mentor.check_students_submitted
puts mentor.set_status_success(student1, 2)
puts student1.check_passed
puts student2.check_passed

# Here is the output of the app:

# Mentor Timur create task #1
# Student Igor was notified about task 1
# Student Sergey was notified about task 1
# Mentor Timur create task #2
# Student Igor was notified about task 2
# Student Sergey was notified about task 2
# --------------------
# Igor submit homework #1
# Igor submit homework #2
# Sergey submit homework #1
# Mentor checks. Next students submitted their homeworks:
# Igor - #1, 2
# Sergey - #1
# Mentor set status -success- for Igor task #1
# Mentor set status -success- for Sergey task #1
# Mentor set status -denied- for Igor task #2
# --------------------
# Igor check. Next homeworks denied: #2
# Igor submit homework #2
# Mentor checks. Next students submitted their homeworks:
# Igor - #2
# Mentor set status -success- for Igor task #2
# Igor check. Next homeworks passed: #1  #2
# Sergey check. Next homeworks passed: #1

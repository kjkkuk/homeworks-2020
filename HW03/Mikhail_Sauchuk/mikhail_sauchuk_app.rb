require_relative 'student'
require_relative 'mentor'
require_relative 'homework'

# create a students and mentor
student01 = Student.new('Mike', 'Palnas')
student02 = Student.new('Pam', 'Glass')
mentor = MentorMath.new('Gerorge', 'Perelman')
puts ''
# create a homeworks
homework01 = Homework.new('math_task_01')
homework02 = Homework.new('math_task_02')
homework03 = Homework.new('math_task_03')
puts ''
# students and mentor subscribe each other
student01.attach(mentor)
student02.attach(mentor)
mentor.attach(student01)
mentor.attach(student02)
puts ''
# assigne homeworks to students
student01.take_homework(homework01)
student01.take_homework(homework02)
student02.take_homework(homework03)
puts ''
# student #1 does his homework ->
# mentor recieves notifications after each homework
student01.do_homework
student01.do_homework
puts ''
# mentor check homeworks and send checked tasks back to the students
# student #2 doen's recieve a notification
mentor.check_homework
puts ''
# student #2 does his homework ->
# mentor recieves notifications
student02.do_homework
puts ''
# mentor check one homework and send checked task back to the student #2
# student #1 doen's recieve a notification
mentor.check_homework

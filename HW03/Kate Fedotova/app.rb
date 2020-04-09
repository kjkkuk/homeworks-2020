require_relative 'mentor'
require_relative 'student'
require_relative 'homework'
require_relative 'notification'

student = Student.new('John', 'Doe')
mentor = Mentor.new('Jack', 'Gonsales')

student.submit_homework(Homework.new('homework_1'))
student.homeworks # => [Homework, ...]

mentor.subscribe_to(student)
mentor.notifications # => []

student.submit_homework(Homework.new('homework_1'))
mentor.notifications # => [Notification, ...]

mentor.read_notifications
mentor.notifications # => []

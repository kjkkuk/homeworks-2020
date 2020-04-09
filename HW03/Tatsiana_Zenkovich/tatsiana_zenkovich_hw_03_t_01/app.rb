require_relative 'student'
require_relative 'mentor'
require_relative 'task'

student = Student.new('John', 'Doe')
mentor = Mentor.new('Jack', 'Gonsales')

student.subscribe_to(mentor)
student.mentors # => [Mentor, ...]

mentor.prepare_task('your task')
mentor.tasks # => [Task, ...]

mentor.subscribe_to(student)
mentor.students # => [Student, ...]

mentor.send_task_to_student(student)
student.tasks # => [Task, ...]

student.submit_homework!('Homework')
student.homeworks # => [Homework, ...]

mentor.notifications # => [Notification, ...]
mentor.read_notifications!
mentor.notifications # => []

mentor.prepare_task('your task')
mentor.tasks # => [Task, Task ...]

mentor.send_task_to_student(student)
student.tasks # => [Task, Task ...]

student.submit_homework!('Homework')
student.homeworks # => [Homework, Homework...]

mentor.notifications # => [Notification, ...]
mentor.read_notifications!
mentor.notifications # => []

mentor.unsubscribe_from(student)
mentor.students # => []
student.unsubscribe_from(mentor)
student.mentors # => []

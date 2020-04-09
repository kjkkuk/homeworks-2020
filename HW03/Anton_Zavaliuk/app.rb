require_relative 'lib/mentor'
require_relative 'lib/student'
require_relative 'lib/postgres/api'

post_gres = PostGres.instance
post_gres.init_mentors
post_gres.init_students
post_gres.init_notifications
student = Student.new('Anton', 'Gonzales', 5, 2)
mentor1 = Mentor.new('Alexey', 'Filardov', 6)
student.add_mark(50)
mentor1.subscribe_to(student)
student.submit_homework!('Hello World')

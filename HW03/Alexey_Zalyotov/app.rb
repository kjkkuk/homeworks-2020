require_relative 'lib/person'
require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/task'
require_relative 'lib/notification'
require_relative 'lib/repo'

student = Student.new(name: 'John', surname: 'Doe')
mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')

tasks2020 = mentor.create_repo
tasks2020.show_tasks

student.subscribe_repo(tasks2020)
student.show_notifications

mentor.create_task!('First easy task', tasks2020)
tasks2020.show_tasks
student.show_notifications

student.take_task(tasks2020)
student.read_notifications!
student.show_notifications
mentor.show_notifications
mentor.read_notifications!

student.submit_task!('Solution of task 1')
mentor.show_notifications

mentor.review_task!('Some decision notes to task 1')
mentor.read_notifications!

student.show_notifications
student.submit_task!('Fixed solution of task 1')
mentor.show_notifications

mentor.approve_task!
mentor.read_notifications!

student.show_notifications
student.close_task!
student.read_notifications!

tasks2020.show_tasks

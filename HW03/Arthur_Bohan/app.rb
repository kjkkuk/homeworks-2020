require_relative 'student'
require_relative 'mentor'
require_relative 'homework'
require_relative 'notification'

# module
module App
  def self.run
    student = Student.new(name: 'John', surname: 'Doe')
    mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')

    student.submit_homework!('Homework01') # ==> [] without subscribed mentor
    student.homeworks # ==> []

    mentor.subscribe_to(student) #==>Jack Gonsales(mentor) subscribes to student
    student.notifications # ==> [Notification about subscribtion]
    student.read_notification!
    student.notifications # ==> [] are clear because he read about subscribtions

    mentor.notifications # ==> [] There aren't homeworks
    student.submit_homework!('Homework02') # ==> John Doe submits: Homework02
    mentor.notifications # ==> [Notification about homework]

    mentor.read_notification!
    mentor.notifications # ==> [] are clear because he read about homework
  end
end

App.run

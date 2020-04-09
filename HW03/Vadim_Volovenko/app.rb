require_relative 'student'
require_relative 'mentor'
require_relative 'homework'
require_relative 'notifications'

module App
  def self.run
    student = Student.new(name: 'Vadim', surname: 'Volovenko')
    mentor = Mentor.new(name: 'Ruby', surname: 'Master')

    student.submit_homework!(homework_data)
    student.homeworks # => [Homework, ...]

    mentor.subscribe_to(student)
    mentor.notifications # => []

    student.submit_homework!(homework_data)
    mentor.notifications # => [Notification, ...]

    mentor.read_notifications!
    mentor.notifications # => []
  end
end

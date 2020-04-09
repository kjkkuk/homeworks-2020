require_relative 'student'
require_relative 'mentor'
require_relative 'homework'

module App
  def self.run
    # create persons
    student = Student.new(name: 'Ivan', surname: 'Iavnov')
    mentor = Mentor.new(name: 'John', surname: 'Smith')

    # p student.show_homeworks - must be showed the message "Do homework!"
    student.submit_homework('my homework1')
    student.show_homeworks # => [Homework, ...]

    mentor.subscribe_to(student)
    mentor.show_notifications # => []

    student.submit_homework('my homework2')
    mentor.show_notifications # => [Notification, ...]

    mentor.read_notifications!
    mentor.notifications # => []
  end
end

App.run

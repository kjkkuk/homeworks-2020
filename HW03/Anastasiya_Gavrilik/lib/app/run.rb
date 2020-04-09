module App
  # rubocop:disable Metrics/MethodLength
  def self.run
    student = Student.new(name: 'John', surname: 'Doe')
    mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')

    mentor.create_homework('HW_01')
    student.get_and_do_homework(mentor)

    student.submit_homework!
    student.homeworks # => [Homework, ...]

    mentor.subscribe_to(student)
    mentor.notifications # => []

    student.submit_homework!
    mentor.notifications # => [Notification, ...]

    mentor.read_notifications!
    mentor.notifications # => []
  end
  # rubocop:enable Metrics/MethodLength
end

# frozen_string_literal: true

require_relative 'student'
require_relative 'mentor'
require_relative 'homeworks'
require_relative 'notifications'

module App
  def self.run
    student = Student.new(name: 'John', surname: 'Doe')
    mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')

    student.submit_homework!('project № 1')
    student.show_homeworks # => 'Submitted: homework '

    mentor.subscribe_to(student)
    mentor.show_notifications # => ' notifications'

    student.submit_homework!('project № 2')
    mentor.show_notifications # => 'Show notification'

    mentor.read_notifications!
    mentor.show_notifications # => 'No notifications'
  end
end

App.run

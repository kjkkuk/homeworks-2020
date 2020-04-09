require_relative 'mentor_notification'
require_relative 'student_notification'

class Notification
  attr_reader :subject

  def initialize(subject:)
    @subject = subject
  end

  def to_mentors
    MentorNotification.new(subject)
  end

  def to_student
    StudentNotification.new(subject)
  end
end

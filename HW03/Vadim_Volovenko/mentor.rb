class Mentor
  attr_reader :notifications
  attr_accessor :mentors

  def initialize(name, surname)
    @name = name
    @surname = surname
    @notifications = []
  end

  def subscribe_to(student)
    student.mentor << self
  end

  def show_notifications
    puts notifications.zero? ? 'No notifications' : notifications
  end

  def read_notifications!
    notifications.clear
  end
end

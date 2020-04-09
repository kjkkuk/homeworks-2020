class Mentor
  attr_reader :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
  end

  def full_name
    "#{@name} #{@surname}"
  end

  def subscribe_to(student)
    student.mentors << self
  end

  def delete_mentor(mentor)
    student.mentors.delete(mentor)
  end

  def show_notifications
    "Mr. #{full_name}! Here are your notifications: #{notifications}"
  end

  def read_notifications!
    @notifications.clear
  end
end

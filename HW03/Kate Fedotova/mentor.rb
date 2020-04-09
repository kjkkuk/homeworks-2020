class Mentor
  attr_reader :name, :surname, :notifications

  def initialize(name, surname)
    @name = name
    @surname = surname
    @notifications = []
  end

  def subscribe_to(student)
    student.submit_mentor(self)
  end

  def send_notification(message)
    notification = Notification.new(message)
    notifications << notification
  end

  def read_notifications
    puts @notifications.to_s
    notifications.clear
  end
end

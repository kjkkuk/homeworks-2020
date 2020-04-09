class Person
  attr_reader :name, :surname
  attr_accessor :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
  end

  def show_notifications
    puts notifications.empty? ? 'No notifications' : formated_notifications
  end

  def read_notifications!
    notifications.clear
  end

  private

  def formated_notifications
    "____________________________\n" \
    "#{self.class}`s notifications:\n" \
    "#{notifications.map(&:to_s).join("\n")}"
  end
end

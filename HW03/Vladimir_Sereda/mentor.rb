# frozen_string_literal: true

class Mentor
  attr_reader :notifications
  attr_accessor :mentors
  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
  end

  def subscribe_to(student)
    student.mentors << self
  end

  def show_notifications
    notifications.empty? ? (puts 'no notifications yet') : (puts notifications)
  end

  def read_notifications!
    @notifications.clear
  end
end

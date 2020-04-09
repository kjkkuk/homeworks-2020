class Student
  TO_WORK = 'to_work'.freeze
  TO_CHECK = 'to_check'.freeze

  attr_accessor :homeworks, :notifications
  attr_reader :name, :surname, :mentors

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
    @mentors = []
  end

  def mark_as_read!
    notifications.clear
  end

  def to_work!(homework)
    homework.status = TO_WORK
    homeworks << homework
    notification(homework: homework).homework_to_work
  end

  def add_answer!(homework, answer)
    homework.answer = answer
  end

  def to_check!(homework)
    homework.status = TO_CHECK
    notification(homework: homework).homework_to_check
  end

  private

  def notification(homework)
    Notification.new(subject: homework).to_mentors
  end
end

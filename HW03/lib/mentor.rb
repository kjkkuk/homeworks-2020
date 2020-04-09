class Mentor
  TO_WORK = 'to_work'.freeze
  DONE = 'done'.freeze

  attr_accessor :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
  end

  def add_homework(data)
    homework = Homework.new(title: data[:title],
                            description: data[:description],
                            student: data[:student])
    notification(homework: homework).add_new_homework
    homework
  end

  def reject_to_work!(homework)
    homework.status = TO_WORK
    notification(homework: homework).reject_homework
  end

  def accept!(homework)
    homework.status = DONE
    notification(homework: homework).accept_homework
  end

  def subscribe_to!(student)
    student.mentors << self
  end

  def mark_as_read!
    notifications.clear
  end

  private

  def notification(homework)
    Notification.new(subject: homework).to_student
  end
end

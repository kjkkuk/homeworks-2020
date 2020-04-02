# frozen_string_literal: true

class Notification
  attr_reader :homework

  def initialize(homework)
    @homework = homework
  end

  def notify(receiver:, message:)
    if receiver == :student
      send_student(message)
    elsif receiver == :mentors
      send_mentors(message)
    end
  end

  def add_new_lection
    notify(receiver: :student, message: "Add new lection #{lections.title}")
  end

  def add_new_homework
    notify(receiver: :student, message: "Add new homework #{homework.title}")
  end

  def create_hw
    notify(receiver: :mentor, message: "Mentor create: #{homework.title}")
  end

  def questions; end

  def answers; end

  def homework_to_work
    notify(receiver: :mentor, message: "Student #{student_str} do: #{homework.title}")
  end

  def homework_to_check
    notify(receiver: :mentor, message: "Student '#{student_str}' send to check: #{homework.title}")
  end

  def complete_homework
    notify(receiver: :student, message: "Your homework '#{homework.title}' completed!")
  end

  def error_homework
    notify(receiver: :student, message: "Your homework '#{homework.title}' have an errors!")
  end

  def send_student(message)
    student_notifications << message
  end

  def send_mentors(message)
    student_mentors.each do |mentor|
      mentor.notifications << message
    end
  end

  def student_str
    "#{homework.student.name} #{homework.student.surname}"
  end

  def student_mentors
    homework.student.mentors
  end

  def student_notifications
    homework.student.notifications
  end
end

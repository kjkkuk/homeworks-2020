# frozen_string_literal: true

class Mentor
  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
  end

  def set_lections(knwl)
    lections = Lections.new(knwl[:title], knwl[:description])
    notification(lections).add_new_lection
  end

  def read_lections
    student << lections
  end

  def set_homework(homework)
    homework.status = 'created'
    notification(homework).create_hw
  end

  def add_tasks(data)
    homework = Homework.new(data[:title], data[:description], data[:student])
    notification(homework).add_new_homework
  end

  def answer_questions(question, answer)
    answer.question = question
  end

  def add_questions(questions, answer)
    questions.answer = answer
  end

  def set_tasks; end

  def check_tasks; end

  def subscribe_to(student)
    student.mentors << self
  end

  def show_notifications
    notifications.empty? ? (puts 'No notifications') : (puts notifications)
  end

  def read_notifications!
    @notifications.clear
  end

  private

  attr_reader :notifications
end

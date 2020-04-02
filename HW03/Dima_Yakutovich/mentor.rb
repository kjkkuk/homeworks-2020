# frozen_string_literal: true

class Mentor
  attr_reader :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
  end

  def set_lections(knwl)
    lections = Lections.new(knwl[:title], knwl[:description])
    notification(lections).add_new_lection
  end

  def read_lections(lections)
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
    notification.answers
  end

  def accept!(homework)
    homework.status = 'done'
    notification(homework).complete_homework
  end
end

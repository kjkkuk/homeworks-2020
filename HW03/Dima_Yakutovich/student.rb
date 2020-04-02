# frozen_string_literal: true

class Student
  attr_reader :name, :surname, :homeworks, :mentors, :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = []
    @mentors = []
    @notifications = []
  end

  def sumbit_homework!(number, description, link)
    homework = Homework.new(number, description, link)
    @homeworks << homework
  end

  def ask_questions(question, ask)
    question.ask = ask
    notification.questions
  end

  def do_tasks(homework)
    homework.status = 'work'
    @homeworks << homework
    notification(homework).homework_to_work
  end

  def send_homework(task)
    homework = Homework.new(task[:title], task[:description], task[:student])
    notification(homework).add_new_homework
    homework
  end

  def to_check!(homework)
    homework.status = 'to_check'
    notification(homework).homework_to_check
  end

  def notification(homework)
    Notification.new(homework)
  end
end

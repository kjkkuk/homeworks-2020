# frozen_string_literal: true

class Student
  attr_reader :name, :surname, :homeworks
  attr_accessor :mentors

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = []
    @mentors = []
  end

  def submit_homework!(homework_data)
    homework = Homework.new(homework_data)
    homeworks << homework
    notificate_mentors(homework)
  end

  def show_homeworks
    puts homeworks.empty? ? 'No homeworks' : homeworks
  end

  def notificate_mentors(homework)
    mentors.each do |mentor|
      mentor.notifications << Notification.new(self, homework)
    end
  end
end

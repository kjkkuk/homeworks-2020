# frozen_string_literal: true

class Notification
  attr_reader :student, :homework
  def initialize(student, homework)
    @student = student
    @homework = homework
  end

  def to_s
    "#{student.name} #{student.surname} submit #{homework.homework_data}"
  end
end

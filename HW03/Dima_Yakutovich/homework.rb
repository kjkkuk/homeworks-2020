class Homework
  attr_accessor :status, :answer
  attr_reader :title, :description, :student

  def initialize(title, description, student)
    @title = title
    @description = description
    @student = student
    @status = ''
  end
end

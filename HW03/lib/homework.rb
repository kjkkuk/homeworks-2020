class Homework
  NEW = 'new'.freeze

  attr_accessor :status, :answer
  attr_reader :title, :description, :student

  def initialize(title:, description:, student:)
    @title = title
    @description = description
    @student = student
    @answer = ''
    @status = NEW
  end
end

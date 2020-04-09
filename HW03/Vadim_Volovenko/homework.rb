class Homework
  attr_reader :homework_data

  def initialize(homework_data)
    @homework_data = homework_data
  end

  def to_s
    homework_data.to_s
  end
end

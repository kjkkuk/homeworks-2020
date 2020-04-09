class Notifications
  attr_reader :student, :homework

  def initialize(student, homework)
    @student = student
    @homework = homework
  end

  def to_s
    "#{student.name} #{student.surname} sent #{homework.homework_data}"
  end
end

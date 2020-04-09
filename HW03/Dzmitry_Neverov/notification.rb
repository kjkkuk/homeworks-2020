class Notification
  attr_reader :student, :homework

  def initialize(student, homework)
    @student = student
    @homework = homework
  end

  def new
    "#{student.name} #{student.surname} add #{homework[:homework]}"
  end
end

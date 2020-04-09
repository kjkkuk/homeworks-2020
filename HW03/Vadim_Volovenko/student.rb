class Student
  attr_reader :name, :surname, :homeworks
  attr_accessor :mentors

  def initialize(name:, surname:)
    @name = name
    @surname = surname
  end

  def notify_mentors(new_homework)
    mentors.each do |mentor|
      mentor.notifications << Notification.new(self, new_homework)
    end
  end

  def submit_homework(homework_data)
    new_homework = Homework.new(homework_data)
    homeworks << new_homework
    notify_mentors(new_homework)
  end
end

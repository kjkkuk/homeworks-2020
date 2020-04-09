class Student
  attr_reader :name, :surname
  attr_accessor :students_with_mentor, :all_homework

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @all_homework = []
    @students_with_mentor = []
  end

  def notification_for_mentor(new_homework)
    students_with_mentor.each do |mentor|
      mentor.notification << Notification.new(self, homework: new_homework).new
    end
  end

  def submit_homework!(new_task)
    all_homework << new_task
    notification_for_mentor(new_task)
  end

  def view_homework_list
    puts("All homework #{name} #{surname} :#{all_homework}")
  end
end
